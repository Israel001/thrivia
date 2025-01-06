import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:thrivia_app/app/app.locator.dart';
import 'package:thrivia_app/app/app.logger.dart';
import 'package:thrivia_app/common/api_constants.dart';
import 'package:thrivia_app/common/json_parser.dart';
import 'package:thrivia_app/feat_auth/data_models/data_models.barrel.dart';
import 'package:thrivia_app/feat_auth/services/auth_service.dart';
import 'package:thrivia_app/services/dio_service.dart';

import '../../common/exceptions.dart';

class AuthRepository {
  final _dio = locator<DioService>().dio;
  final _logger = getLogger("AuthRepository");

  FutureOr<CreateAccountResponse> createAccount(
      CreateUserRequest newUser) async {
    _logger.v("creating user");
    final response = await _dio.postUri(
        Uri.https(
          ApiConstants.authority,
          ApiConstants.users,
        ),
        data: newUser.toRawJson());

    if (response.statusCode == 201) {
      try {
        final otpResponse = CreateAccountResponse.fromJson(response.data);
        _logger.v("Return otp response");
        return otpResponse;
      } catch (e) {
        _logger.e("Error parsing response");
        throw InternalExcpetion(
            message: "Could not parse createAccountResponse",
            devDetails: "$e",
            prettyDetails: "Oops, something went wrong");
      }
    }

    if (response.statusCode == 409) {
      _logger.v("Account already exists");

      throw BackendException(
          message: "Account already exists",
          devDetails: "$response",
          prettyDetails: "Sorry, this account exists already");
    }

    if (response.statusCode == 400) {
      _logger.v("Bad request");

      throw BackendException(
          message: "Bad request",
          devDetails: "$response",
          prettyDetails: "Error creating account: ${response.data.message}");
    }
    _logger.v("Could not create account");

    throw BackendException(
        message: "Could not create account",
        devDetails: "${response.data.message}",
        prettyDetails: "An error occured while trying to create your account");
  }

  FutureOr<MultipleJsonType> loginUser(LoginUserRequest userLogin) async {
    _logger.v("Logging in user");

    final response = await _dio.postUri(
        Uri.https(
          ApiConstants.authority,
          ApiConstants.authLogin,
        ),
        data: userLogin.toRawJson());

    if (response.statusCode == 201) {
      _logger.v("user authorised");

      return response.data;
    }

    if (response.statusCode == 401) {
      throw BackendException(
          message: "User login failed",
          devDetails: "$response",
          prettyDetails: "Incorrect login details");
    }
    throw BackendException(
        message: "Unable to login User",
        devDetails: "$response",
        prettyDetails:
            "Unexpected error encountered while trying to log you in");
  }

  FutureOr<MultipleJsonType> verifyOTP(VerifyOTPBody tokenData) async {
    final response = await _dio.postUri(
        Uri.https(
          ApiConstants.authority,
          ApiConstants.authVerifyOTP,
        ),
        data: tokenData.toRawJson());

    if (response.statusCode == 201) {
      _logger.v("OTP verified successfully");
      response.data;
      return;
    }
    if (response.statusCode == 401) {
      _logger.v("OTP is not valid");
      throw BackendException(
          message: "Invalid OTP",
          devDetails: "$response",
          prettyDetails: "Invalid OTP");
    }

    throw BackendException(
        message: "Unexpected Response",
        devDetails: "$response",
        prettyDetails:
            "Unexpected error encountered while trying to verify your OTP");
  }

  FutureOr<String> requestOTP(SendOTPRequest sendOTPData) async {
    final response = await _dio.postUri(
        Uri.https(
          ApiConstants.authority,
          ApiConstants.authSendOTP,
        ),
        data: sendOTPData.toRawJson());

    if (response.statusCode == 201) {
      _logger.v("OTP sent successfully");
      try {
        return "${response.data}";
        // return VerifyOTPBody.fromJson(response.data);
      } catch (e) {
        throw InternalExcpetion(
          message: "Unexpected response",
          devDetails: "$e",
          prettyDetails: "Unexpected error encountered while parsing response",
        );
      }
    }
    throw BackendException(
        message: "Unexpected Response",
        devDetails: "$response",
        prettyDetails: "Unexpected error encountered while sending your OTP");
  }

  FutureOr<VerifyOTPBody> intiateResetPassword(
      String emailOrPhoneNumber) async {
    _logger.v("intiate reset password");
    final data = jsonEncode({"emailOrPhone": emailOrPhoneNumber});
    final response = await _dio.postUri(
        Uri.https(
          ApiConstants.authority,
          ApiConstants.authInitResetPassword,
        ),
        data: data);

    if (response.statusCode == 201) {
      try {
        return VerifyOTPBody.fromJson(response.data)
            .copyWith(otpActionType: OtpActionType.RESET_PASSWORD);
      } catch (e) {
        throw InternalExcpetion(
          message: "Unexpected response",
          devDetails: "$e",
          prettyDetails: "Unexpected error encountered while parsing response",
        );
      }
    }

    throw BackendException(
        message: "Could not reset password",
        devDetails: "${response.data.message}",
        prettyDetails: "An error occured while trying to reset your password");
  }

  FutureOr<void> resetPassword(
    String newPassword,
    String accessToken,
  ) async {
    final data = jsonEncode({"password": newPassword});
    final response = await _dio.postUri(
        Uri.https(
          ApiConstants.authority,
          ApiConstants.authResetPassword,
        ),
        data: data,
        options: Options(
          headers: {"Authority": "Bearer $accessToken"},
        ));

    if (response.statusCode == 201) {
      _logger.v("Password reset successfully");
      return response.data;
    }

    throw BackendException(
        message: "Unexpected Response",
        devDetails: "$response",
        prettyDetails:
            "Unexpected error encountered while resetting your password");
  }
}
