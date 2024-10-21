import 'dart:convert';
import 'package:thrivia_app/feat_auth/data_models/enums.dart';
import 'package:thrivia_app/feat_auth/services/auth_service.dart';

class LoginUserRequest {
  final String emailOrPhone;
  final String password;
  final Role role;

  LoginUserRequest({
    required this.emailOrPhone,
    required this.password,
    required this.role,
  });

  LoginUserRequest copyWith({
    String? emailOrPhone,
    String? password,
    Role? role,
  }) =>
      LoginUserRequest(
        emailOrPhone: emailOrPhone ?? this.emailOrPhone,
        password: password ?? this.password,
        role: role ?? this.role,
      );

  factory LoginUserRequest.fromRawJson(String str) =>
      LoginUserRequest.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LoginUserRequest.fromJson(Map<String, dynamic> json) =>
      LoginUserRequest(
        emailOrPhone: json["emailOrPhone"],
        password: json["password"],
        role: roleValues.map[json["role"]]!,
      );

  Map<String, dynamic> toJson() => {
        "emailOrPhone": emailOrPhone,
        "password": password,
        "role": roleValues.reverse[role],
      };
}
