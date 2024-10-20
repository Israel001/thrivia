import 'dart:async';

import 'package:dio/dio.dart';
import 'package:thrivia_app/ui/common/api_constants.dart';

import 'dart:convert';

class AuthService {
  FutureOr<void> createAccount(CreateUserAPI newUser) async {
    // return;
    Dio dio = Dio();
    final response = await dio.postUri(
        Uri.https(
          ApiConstants.authority,
          ApiConstants.users,
        ),
        data: newUser.toRawJson());

    if (response.statusCode == 201) {}
  }
}

class CreateUserAPI {
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String password;
  final String bvn;
  final String nin;

  CreateUserAPI({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.password,
    required this.bvn,
    required this.nin,
  });

  CreateUserAPI copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? phoneNumber,
    String? password,
    String? bvn,
    String? nin,
  }) =>
      CreateUserAPI(
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        password: password ?? this.password,
        bvn: bvn ?? this.bvn,
        nin: nin ?? this.nin,
      );

  factory CreateUserAPI.fromRawJson(String str) =>
      CreateUserAPI.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CreateUserAPI.fromJson(Map<String, dynamic> json) => CreateUserAPI(
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        password: json["password"],
        bvn: json["bvn"],
        nin: json["nin"],
      );

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "phoneNumber": phoneNumber,
        "password": password,
        "bvn": bvn,
        "nin": nin,
      };
}
