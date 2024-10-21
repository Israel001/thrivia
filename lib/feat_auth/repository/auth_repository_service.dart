import 'dart:async';

import 'package:thrivia_app/app/app.locator.dart';
import 'package:thrivia_app/feat_auth/data_models/data_models.barrel.dart';
import 'package:thrivia_app/services/dio_service.dart';

import '../../common/api_constants.dart';

class AuthRepository {
  final dio = locator<DioService>().dio;
  FutureOr<CreateAccountResponse> createAccount(
      CreateUserRequest newUser) async {
    // return;

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

  FutureOr<void> loginUser(LoginUserRequest userLogin) async {
    // return;

    final response = await dio.postUri(
        Uri.https(
          ApiConstants.authority,
          ApiConstants.authLogin,
        ),
        data: userLogin.toRawJson());

    if (response.statusCode == 201) {}
  }

  FutureOr<String> verifyOTP(VerifyOTPRequest tokenData) async {
    final response = await dio.postUri(
        Uri.https(
          ApiConstants.authority,
          ApiConstants.authVerifyOTP,
        ),
        data: tokenData.toRawJson());

    if (response.statusCode == 201) {
      final accessToken = response.data['access_token'] as String;
      return accessToken;
    }
    throw Exception("Could not verify token: ${response.statusMessage}");
  }

  FutureOr<void> sendOTP(SendOTPRequest sendOTPData) async {}
}
