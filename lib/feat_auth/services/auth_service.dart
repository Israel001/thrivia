import 'dart:async';

import 'package:dio/dio.dart';
import 'package:stacked/stacked.dart';
import 'package:thrivia_app/app/app.locator.dart';
import 'package:thrivia_app/feat_auth/data_models/data_models.barrel.dart';

import '../repository/auth_repository_service.dart';

class AuthService with ListenableServiceMixin {
  AuthState _authState = AuthState.newUser;
  String? _accessToken;

  dynamic _otpDetails;

  AuthService() {
    listenToReactiveValues([_authState]);
  }

  final AuthRepository _authRepository = locator<AuthRepository>();

  String? _passwordChangeToken;

  FutureOr<void> createAccount(CreateUserRequest newUser) async {
    try {
      final response = await _authRepository.createAccount(newUser);
      _authState = AuthState.pendingVerifyOTP;
      _otpDetails = response;
    } catch (e) {
      //TODO: handle 409 error and other errors
    }
  }

  FutureOr<void> loginUser(LoginUserRequest userLogin) async {
    try {
      final response = await _authRepository.loginUser(userLogin);

      if (response is String) {
        _authState = AuthState.loggedIn;
        _accessToken = response;
        return;
      }

      if (response is CreateAccountResponse) {
        _authState = AuthState.pendingVerifyOTP;
        _otpDetails = response;
      }
    } catch (e) {}
  }

  FutureOr<void> verifyOTP(VerifyOTPRequest verifyRequest) async {
    try {
      final response = await _authRepository.verifyOTP(verifyRequest);

      if (verifyRequest.otpActionType == OtpActionType.VERIFY_ACCOUNT) {
        _accessToken = response;
        _authState = AuthState.loggedIn;
        return;
      }

      if (verifyRequest.otpActionType == OtpActionType.RESET_PASSWORD) {
        _passwordChangeToken = response;
        _authState =
            _accessToken == null ? AuthState.logggedOut : AuthState.loggedIn;
      }
    } catch (e) {}
  }

  //send otp

  FutureOr<void> sendOTP(SendOTPRequest sendOTPData) async {
    _authState = sendOTPData.otpActionType == OtpActionType.VERIFY_ACCOUNT
        ? AuthState.pendingVerifyOTP
        : _authState;

    _authState = sendOTPData.otpActionType == OtpActionType.RESET_PASSWORD
        ? AuthState.pendingPasswordResetOTP
        : _authState;

    try {
      await _authRepository.sendOTP(sendOTPData);
//TODO handle otp not sent
    } catch (e) {}
  }

  // logout

  // reset password
}
