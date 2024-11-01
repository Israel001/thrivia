import 'dart:async';

import 'package:dio/dio.dart';
import 'package:thrivia_app/app/app.locator.dart';
import 'package:thrivia_app/app/app.logger.dart';
import 'package:thrivia_app/common/exceptions.dart';
import 'package:thrivia_app/feat_auth/data_models/data_models.barrel.dart';
import 'package:thrivia_app/feat_auth/data_models/login_user_response.dart';
import 'package:thrivia_app/services/dio_service.dart';

import '../../common/api_constants.dart';

class AuthRepository {
  final dio = locator<DioService>().dio;
  final logger = getLogger("AuthRepository");

  FutureOr<CreateAccountResponse> createAccount(
      CreateUserRequest newUser) async {
    logger.v("creating user");
    final response = await dio.postUri(
        Uri.https(
          ApiConstants.authority,
          ApiConstants.users,
        ),
        data: newUser.toRawJson());

    if (response.statusCode == 201) {
      try {
        final otpResponse = CreateAccountResponse.fromJson(response.data);
        logger.v("Return otp response");
        return otpResponse;
      } catch (e) {
        logger.e("Error parsing response");
        throw InternalExcpetion(
            message: "Could not parse createAccountResponse",
            devDetails: "$e",
            prettyDetails: "Oops, something went wrong");
      }
    }

    if (response.statusCode == 409) {
      logger.v("Account already exists");

      throw BackendException(
          message: "Account already exists",
          devDetails: "$response",
          prettyDetails: "Sorry, this account exists already");
    }

    if (response.statusCode == 400) {
      logger.v("Bad request");

      throw BackendException(
          message: "Bad request",
          devDetails: "$response",
          prettyDetails: "Error creating account: ${response.data.message}");
    }
    logger.v("Could not create account");

    throw BackendException(
        message: "Could not create account",
        devDetails: "response.data.message",
        prettyDetails: "An error occured while trying to create your account");
  }

  FutureOr<dynamic> loginUser(LoginUserRequest userLogin) async {
    logger.v("Logging in user");

    final response = await dio.postUri(
        Uri.https(
          ApiConstants.authority,
          ApiConstants.authLogin,
        ),
        data: userLogin.toRawJson());

    if (response.statusCode == 201) {
      logger.v("user authorised");
      try {
        final LoginResponse userResponse =
            LoginResponse.fromJson(response.data);
        logger.v("login successful");
        return userResponse;
      } catch (e) {
        try {
          final tokenRequest = CreateAccountResponse.fromJson(response.data);
          logger.v("user not verified, received otp details");
          return tokenRequest;
        } catch (e) {
          logger.wtf(
              "Unexpected error, user logged in but response is not otp or login response");
          throw BackendException(
              message: "User login succesfull, but response is invalid",
              devDetails: e.toString(),
              prettyDetails:
                  "Unexpected error encountered while logging you in");
        }
      }
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

  FutureOr<dynamic> verifyOTP(VerifyOTPRequest tokenData) async {
    final response = await dio.postUri(
        Uri.https(
          ApiConstants.authority,
          ApiConstants.authVerifyOTP,
        ),
        data: tokenData.toRawJson());

    if (response.statusCode == 201) {
      logger.v("OTP verified successfully");
      final accessToken = response.data;
      return accessToken;
    }
    if (response.statusCode == 401) {
      logger.v("OTP is not valid");
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

  FutureOr<String> sendOTP(SendOTPRequest sendOTPData) async {
    final response = await dio.postUri(
        Uri.https(
          ApiConstants.authority,
          ApiConstants.authSendOTP,
        ),
        data: sendOTPData.toRawJson());

    if (response.statusCode == 201) {
      logger.v("OTP sent successfully");
      return response.data;
    }
    throw BackendException(
        message: "Unexpected Response",
        devDetails: "$response",
        prettyDetails: "Unexpected error encountered while sending your OTP");
  }
}
