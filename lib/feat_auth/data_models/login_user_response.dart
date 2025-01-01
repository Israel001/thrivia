import 'dart:convert';

import 'package:thrivia_app/feat_users/data_models/user.dart';

class LoginResponse {
  final String accessToken;
  final int expiresIn;
  final String refreshToken;
  final User user;

  LoginResponse({
    required this.accessToken,
    required this.expiresIn,
    required this.refreshToken,
    required this.user,
  });

  LoginResponse copyWith({
    String? accessToken,
    int? expiresIn,
    String? refreshToken,
    User? user,
  }) =>
      LoginResponse(
        accessToken: accessToken ?? this.accessToken,
        expiresIn: expiresIn ?? this.expiresIn,
        refreshToken: refreshToken ?? this.refreshToken,
        user: user ?? this.user,
      );

  factory LoginResponse.fromRawJson(String str) =>
      LoginResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        accessToken: json["accessToken"],
        expiresIn: json["expiresIn"],
        refreshToken: json["refreshToken"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "accessToken": accessToken,
        "expiresIn": expiresIn,
        "refreshToken": refreshToken,
        "user": user.toJson(),
      };
}
