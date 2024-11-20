import 'dart:async';

import 'package:thrivia_app/common/json_parser.dart';
import 'package:thrivia_app/feat_auth/data_models/data_models.barrel.dart';
import 'package:thrivia_app/feat_auth/services/auth_service.dart';

abstract class AuthRepository {
  FutureOr<CreateAccountResponse> createAccount(CreateUserRequest newUser);

  FutureOr<MultipleJsonType> loginUser(LoginUserRequest userLogin);

  FutureOr<MultipleJsonType> verifyOTP(VerifyOTPBody tokenData);

  FutureOr<String> requestOTP(SendOTPRequest sendOTPData);

  FutureOr<VerifyOTPBody> intiateResetPassword(String emailOrPhoneNumber);
  FutureOr<void> resetPassword(String newPassword);
}
