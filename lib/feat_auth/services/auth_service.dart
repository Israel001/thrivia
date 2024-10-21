import 'dart:async';

import 'package:thrivia_app/app/app.locator.dart';
import 'package:thrivia_app/feat_auth/data_models/data_models.barrel.dart';

import '../repository/auth_repository_service.dart';

class AuthService {
  AuthState _authState = AuthState.newUser;
  final AuthRepository _authRepository = locator<AuthRepository>();

  FutureOr<void> createAccount(CreateUserRequest newUser) async {
    try {
      final response = await _authRepository.createAccount(newUser);
    } catch (e) {}
  }

  FutureOr<void> loginUser(LoginUserRequest userLogin) async {
    _authRepository.loginUser(userLogin);
  }
}
