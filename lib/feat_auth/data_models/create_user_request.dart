import 'dart:convert';

class CreateUserRequest {
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String password;
  final String bvn;
  final String nin;

  CreateUserRequest({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.password,
    required this.bvn,
    required this.nin,
  });

  CreateUserRequest copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? phoneNumber,
    String? password,
    String? bvn,
    String? nin,
  }) =>
      CreateUserRequest(
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        password: password ?? this.password,
        bvn: bvn ?? this.bvn,
        nin: nin ?? this.nin,
      );

  factory CreateUserRequest.fromRawJson(String str) =>
      CreateUserRequest.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CreateUserRequest.fromJson(Map<String, dynamic> json) =>
      CreateUserRequest(
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
