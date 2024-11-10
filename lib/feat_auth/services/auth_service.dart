import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:stacked/stacked.dart';
import 'package:thrivia_app/app/app.locator.dart';
import 'package:thrivia_app/app/app.logger.dart';
import 'package:thrivia_app/feat_auth/data_models/data_models.barrel.dart';
import 'package:thrivia_app/feat_auth/data_models/login_user_response.dart';
import 'package:thrivia_app/feat_auth/data_models/user.dart';

import '../repository/auth_repository_service.dart';

class AuthService with ListenableServiceMixin {
  final AuthRepository _authRepository = locator<AuthRepository>();
  final logger = getLogger("AuthService");
  AuthService() {
    listenToReactiveValues([_authState]);
  }

  User? _user;

  AuthState _authState = AuthState.newUser;
  AuthState get authState => _authState;

  bool get goToOTPScreen =>
      _authState == AuthState.pendingVerifyOTP ||
      _authState == AuthState.pendingPasswordResetOTP;

  LoginResponse? _userResponse;
  // String? _refreshToken;

  PendingOTPData? _pendingOTPDetails;

  String? _passwordChangeToken;

  String? _accessToken;
  String? _refreshToken;

  FutureOr<void> createAccount(CreateUserRequest newUser) async {
    final response = await _authRepository.createAccount(newUser);
    _authState = AuthState.pendingVerifyOTP;
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

    if (response is LoginResponse) {
      _authState = AuthState.loggedIn;
      // final loginResponse = response as LoginResponse;
      _user = response.user;
      _accessToken = response.accessToken;
      _refreshToken = response.refreshToken;

      //saveresponse
      // _accessToken = response.accessToken;
      return;
    }

    if (response is CreateAccountResponse) {
      _storeVerifyAccountOTPDetails(response);
      return;
    }
  }

  void _storeVerifyAccountOTPDetails(CreateAccountResponse response) {
    logger.i("storing verify account otp details and updating authState");

    _authState = AuthState.pendingVerifyOTP;
    _pendingOTPDetails = (
      otpActionType: OtpActionType.VERIFY_ACCOUNT,
      pinId: response.pinId,
      userUuid: response.uuid,
      otpVerifyId: null
    );
    logger.d("OTP details: ${_pendingOTPDetails.toString()}");
  }

  Future<void> verifyOTP(String otp) async {
    logger.i("verifying OTP");

    if (_pendingOTPDetails == null) {
      logger.v("pending otp details are null - return");
      return;
    }
    final verifyRequest = VerifyOTPRequest(
        otp: otp,
        otpActionType: _pendingOTPDetails!.otpActionType,
        pinId: _pendingOTPDetails!.pinId,
        userUuid: _pendingOTPDetails!.userUuid);

    await _authRepository.verifyOTP(verifyRequest);

    if (verifyRequest.otpActionType == OtpActionType.VERIFY_ACCOUNT) {
      //save user response

      _authState = AuthState.loggedIn;
    }

    if (verifyRequest.otpActionType == OtpActionType.RESET_PASSWORD) {
      //TODO investigate
      _authState =
          _userResponse == null ? AuthState.logggedOut : AuthState.loggedIn;
    }
    return;
  }

  //send otp

  Future<void> requestOTP() async {
    logger.v("Requesting OTP");
    SendOTPRequest sendOTPData = SendOTPRequest(
      otpActionType: _pendingOTPDetails!.otpActionType,
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
    _pendingOTPDetails = (
      otpActionType: _pendingOTPDetails!.otpActionType,
      otpVerifyId: otpId,
      pinId: _pendingOTPDetails!.pinId,
      userUuid: _pendingOTPDetails!.userUuid
    );
  }

  Future<void> resetPassword(String emailPhoneNumberValue) async {
    logger.v("Initiate reset password");
    final otpDetails =
        await _authRepository.intiateResetPassword(emailPhoneNumberValue);
    _authState = AuthState.pendingPasswordResetOTP;
    _pendingOTPDetails = otpDetails;
  }

  // logout

  // reset password
}

typedef PendingOTPData = ({
  OtpActionType otpActionType,
  String pinId,
  String userUuid,
  String? otpVerifyId,
});
