import 'dart:async';

import 'package:dio/dio.dart';
import 'package:thrivia_app/app/app.locator.dart';
import 'package:thrivia_app/feat_auth/data_models/data_models.barrel.dart';
import 'package:thrivia_app/feat_auth/data_models/login_user_response.dart';
import 'package:thrivia_app/services/dio_service.dart';

import '../../common/api_constants.dart';

class AuthRepository {
  final dio = locator<DioService>().dio;

  FutureOr<CreateAccountResponse> createAccount(
      CreateUserRequest newUser) async {
    final response = await dio.postUri(
        Uri.https(
          ApiConstants.authority,
          ApiConstants.users,
        ),
        data: newUser.toRawJson());

    if (response.statusCode == 201) {
      final otpResponse = CreateAccountResponse.fromJson(response.data);

      return otpResponse;
    }

    throw Exception("Could not create account ${response.statusMessage}");
  }

  FutureOr<dynamic> loginUser(LoginUserRequest userLogin) async {
    // return;
    try {
      final response = await dio.postUri(
          Uri.https(
            ApiConstants.authority,
            ApiConstants.authLogin,
          ),
          data: userLogin.toRawJson());

      if (response.statusCode == 201) {
        try {
          final LoginResponse userResponse =
              LoginResponse.fromJson(response.data);
          return userResponse;
        } catch (e) {
          final tokenRequest = CreateAccountResponse.fromJson(response.data);
          return tokenRequest;
        }
      }
    } catch (e) {
      throw Exception(
          "Unable to login User: ${(e as DioException).response!.data!["message"]}");
    }
  }

  FutureOr<String> verifyOTP(VerifyOTPRequest tokenData) async {
    final response = await dio.postUri(
        Uri.https(
          ApiConstants.authority,
          ApiConstants.authVerifyOTP,
        ),
        data: tokenData.toRawJson());

    if (response.statusCode == 201) {
      final accessToken = response.data;
      return accessToken;
    }
    throw Exception("Could not verify token: ${response.statusMessage}");
  }

  FutureOr<String> sendOTP(SendOTPRequest sendOTPData) async {
    final response = await dio.postUri(
        Uri.https(
          ApiConstants.authority,
          ApiConstants.authSendOTP,
        ),
        data: sendOTPData.toRawJson());

    if (response.statusCode == 201) {
      return response.data;
    }
    throw Exception("Could not send token: ${response.statusMessage}");
  }
}
