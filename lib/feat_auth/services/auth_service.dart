import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:stacked/stacked.dart';
import 'package:thrivia_app/app/app.locator.dart';
import 'package:thrivia_app/feat_auth/data_models/data_models.barrel.dart';
import 'package:thrivia_app/feat_auth/data_models/login_user_response.dart';

import '../repository/auth_repository_service.dart';

class AuthService with ListenableServiceMixin {
  AuthState _authState = AuthState.newUser;
  AuthState get authState => _authState;
  bool get goToOTPScreen =>
      _authState == AuthState.pendingVerifyOTP ||
      _authState == AuthState.pendingPasswordResetOTP;
  String? _accessToken;

  PendingOTPData? _pendingOTPDetails;

  AuthService() {
    listenToReactiveValues([_authState]);
  }

  final AuthRepository _authRepository = locator<AuthRepository>();

  String? _passwordChangeToken;

  FutureOr<void> createAccount(CreateUserRequest newUser) async {
    try {
      final response = await _authRepository.createAccount(newUser);
      _authState = AuthState.pendingVerifyOTP;
      _storeCreateAccountOTPDetails(response);
    } catch (e) {
      //TODO: handle 409 error and other errors
    }
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

      //saveresponse
      _accessToken = response.accessToken;
      return;
    }

    if (response is CreateAccountResponse) {
      _storeCreateAccountOTPDetails(response);
      return;
    }
  }

  void _storeCreateAccountOTPDetails(CreateAccountResponse response) {
    _authState = AuthState.pendingVerifyOTP;
    _pendingOTPDetails = (
      otpActionType: OtpActionType.VERIFY_ACCOUNT,
      pinId: response.pinId,
      userUuid: response.uuid,
      otpVerifyId: null
    );
  }

  FutureOr<bool> verifyOTP(String otp) async {
    if (_pendingOTPDetails == null) {
      return false;
    }
    final verifyRequest = VerifyOTPRequest(
        otp: otp,
        otpActionType: _pendingOTPDetails!.otpActionType,
        pinId: _pendingOTPDetails!.pinId,
        userUuid: _pendingOTPDetails!.userUuid);
    try {
      final response = await _authRepository.verifyOTP(verifyRequest);

      if (verifyRequest.otpActionType == OtpActionType.VERIFY_ACCOUNT) {
        _accessToken = response;
        _authState = AuthState.loggedIn;
      }

      if (verifyRequest.otpActionType == OtpActionType.RESET_PASSWORD) {
        _passwordChangeToken = response;
        _authState =
            _accessToken == null ? AuthState.logggedOut : AuthState.loggedIn;
      }
      return true;
    } catch (e) {
      log("Error verifying otp: ${e.toString()}");
      return false;
    }
  }

  //send otp

  FutureOr<void> sendOTP() async {
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

    try {
      final otpId = await _authRepository.sendOTP(sendOTPData);
      _pendingOTPDetails = (
        otpActionType: _pendingOTPDetails!.otpActionType,
        otpVerifyId: otpId,
        pinId: _pendingOTPDetails!.pinId,
        userUuid: _pendingOTPDetails!.userUuid
      );
//TODO handle otp not sent
    } catch (e) {}
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
