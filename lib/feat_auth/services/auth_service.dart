import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:stacked/stacked.dart';
import 'package:thrivia_app/app/app.locator.dart';
import 'package:thrivia_app/app/app.logger.dart';
import 'package:thrivia_app/common/json_parser.dart';
import 'package:thrivia_app/feat_auth/data_models/data_models.barrel.dart';
import 'package:thrivia_app/feat_auth/data_models/login_user_response.dart';
import 'package:thrivia_app/feat_users/data_models/user.dart';

import '../../common/exceptions.dart';
import '../repository/auth_repository_service.dart';

class AuthService with ListenableServiceMixin {
  final AuthRepository _authRepository = locator<AuthRepository>();
  final logger = getLogger("AuthService");
  AuthService() {
    listenToReactiveValues([_authState]);
  }

  User? _user;
  User? get user => _user;

  AuthState _authState = AuthState.newUser;
  AuthState get authState => _authState;

  bool get goToOTPScreen =>
      _authState == AuthState.pendingVerifyOTP ||
      _authState == AuthState.pendingPasswordResetOTP;

  LoginResponse? _userResponse;
  // String? _refreshToken;

  VerifyOTPBody? _pendingOTPDetails;

  String? _passwordChangeToken;

  String? _accessToken;
  String? _refreshToken;

  DateTime? _expiresIn;

  FutureOr<void> createAccount(CreateUserRequest newUser) async {
    logger.d("Create account ${newUser.toString()}");
    final response = await _authRepository.createAccount(newUser);

    _storeVerifyAccountOTPDetails(response);
  }

  FutureOr<void> loginUser(
      {required String emailOrPhone,
      required String password,
      Role? role}) async {
    final LoginUserRequest userLogin = LoginUserRequest(
        emailOrPhone: emailOrPhone,
        password: password,
        role: role ?? Role.MEMBER);

    final response = await _authRepository.loginUser(userLogin);

    try {
      parseMultipleTypes([
        LoginResponse.fromJson,
        CreateAccountResponse.fromJson,
      ], response);
    } on LoginResponse catch (loginResponse) {
      _authState = AuthState.loggedIn;
      // final loginResponse = response as LoginResponse;
      _user = loginResponse.user;
      _accessToken = loginResponse.accessToken;
      _refreshToken = loginResponse.refreshToken;

      _expiresIn =
          DateTime.now().add(Duration(milliseconds: loginResponse.expiresIn));

      //saveresponse
      // _accessToken = response.accessToken;
      return;
    } on CreateAccountResponse catch (createAccountResponse) {
      _storeVerifyAccountOTPDetails(createAccountResponse);
      return;
    } catch (e) {
      logger.wtf(
          "Unexpected error, user logged in but response is not otp or login response");
      throw BackendException(
          message: "User login succesfull, but response is invalid",
          devDetails: e.toString(),
          prettyDetails: "Unexpected error encountered while logging you in");
    }
  }

  void _storeVerifyAccountOTPDetails(CreateAccountResponse response) {
    logger.i("storing verify account otp details and updating authState");

    _authState = AuthState.pendingVerifyOTP;
    _pendingOTPDetails = VerifyOTPBody(
      otpActionType: OtpActionType.VERIFY_ACCOUNT,
      pinId: response.pinId,
      userUuid: response.uuid,
      // otpVerifyId: null,
      otp: null,
    );
    logger.d("OTP details: ${_pendingOTPDetails.toString()}");
  }

  Future<void> verifyOTP(String otp) async {
    logger.i("verifying OTP");

    if (_pendingOTPDetails == null) {
      logger.v("pending otp details are null - return");
      return;
    }
    final verifyRequest = _pendingOTPDetails!.copyWith(
        otp: otp,
        otpActionType: _pendingOTPDetails!.otpActionType,
        pinId: _pendingOTPDetails!.pinId,
        userUuid: _pendingOTPDetails!.userUuid);

    logger.v("otp request: ${verifyRequest.toString()}");
    final response = await _authRepository.verifyOTP(verifyRequest);
    _passwordChangeToken = response;
    if (verifyRequest.otpActionType == OtpActionType.VERIFY_ACCOUNT) {
      //save user response

      _authState = AuthState.loggedIn;
    }

    if (verifyRequest.otpActionType == OtpActionType.RESET_PASSWORD) {
      _authState = AuthState.validPasswordResetOTP;
    }
  }

  //send otp

  Future<void> requestOTP() async {
    logger.v("Requesting OTP");
    SendOTPRequest sendOTPData = SendOTPRequest(
      otpActionType: _pendingOTPDetails!.otpActionType!,
      userUuid: _pendingOTPDetails!.userUuid,
    );
    _authState = sendOTPData.otpActionType == OtpActionType.VERIFY_ACCOUNT
        ? AuthState.pendingVerifyOTP
        : _authState;

    _authState = sendOTPData.otpActionType == OtpActionType.RESET_PASSWORD
        ? AuthState.pendingPasswordResetOTP
        : _authState;
    logger.v("Updated authState to : $_authState");
    final otpId = await _authRepository.requestOTP(sendOTPData);
    _pendingOTPDetails = VerifyOTPBody(
        otpActionType: _pendingOTPDetails!.otpActionType,
        // otpVerifyId: otpId,

        otp: null,
        pinId: _pendingOTPDetails!.pinId,
        userUuid: _pendingOTPDetails!.userUuid);
  }

  Future<void> initiateResetPassword(String emailPhoneNumberValue) async {
    logger.v("Initiate reset password");
    final otpDetails =
        await _authRepository.initiateResetPassword(emailPhoneNumberValue);
    _authState = AuthState.pendingPasswordResetOTP;
    _pendingOTPDetails = otpDetails;
  }

  Future<void> resetPassword(String password) async {
    logger.v('Reset password');

    await _authRepository.resetPassword(
        newPassword: password, accessToken: _passwordChangeToken!);
    _authState = AuthState.loggedOut;
    _pendingOTPDetails = null;
  }

  // logout

  // reset password
}

// typedef PendingOTPData = ({
//   OtpActionType otpActionType,
//   String pinId,
//   String userUuid,
//   String? otpVerifyId,
// });
