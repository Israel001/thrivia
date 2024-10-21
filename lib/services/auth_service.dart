import 'dart:async';

import 'package:dio/dio.dart';
import 'package:thrivia_app/ui/common/api_constants.dart';

import 'dart:convert';

class AuthService {
  FutureOr<void> createAccount(CreateUserRequest newUser) async {
    try {
      AuthRepository.createAccount(newUser);
    } catch (e) {}
  }

  FutureOr<void> loginUser(LoginUserRequest userLogin) async {
    AuthRepository.loginUser(userLogin);
  }
}

class AuthRepository {
  static FutureOr<CreateAccountResponse> createAccount(
      CreateUserRequest newUser) async {
    // return;
    Dio dio = Dio();
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

  static FutureOr<void> loginUser(LoginUserRequest userLogin) async {
    // return;
    Dio dio = Dio();
    final response = await dio.postUri(
        Uri.https(
          ApiConstants.authority,
          ApiConstants.authLogin,
        ),
        data: userLogin.toRawJson());

    if (response.statusCode == 201) {}
  }

  static FutureOr<String> verifyOTP(VerifyOTPRequest tokenData) async {
    Dio dio = Dio();
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

  static FutureOr<void> sendOTP(SendOTPRequest sendOTPData) async {}
}

class ApiMessage {
  final String? message;
  final String? error;
  final int? statusCode;

  ApiMessage({
    this.message,
    this.error,
    this.statusCode,
  });

  ApiMessage copyWith({
    String? message,
    String? error,
    int? statusCode,
  }) =>
      ApiMessage(
        message: message ?? this.message,
        error: error ?? this.error,
        statusCode: statusCode ?? this.statusCode,
      );

  factory ApiMessage.fromRawJson(String str) =>
      ApiMessage.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ApiMessage.fromJson(Map<String, dynamic> json) => ApiMessage(
        message: json["message"],
        error: json["error"],
        statusCode: json["statusCode"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "error": error,
        "statusCode": statusCode,
      };
}

// class SendOTPAPI {
//   final String userUuid;
//   final String otpActionType;

//   SendOTPAPI({
//     required this.userUuid,
//     required this.otpActionType,
//   });

//   SendOTPAPI copyWith({
//     String? userUuid,
//     String? otpActionType,
//   }) =>
//       SendOTPAPI(
//         userUuid: userUuid ?? this.userUuid,
//         otpActionType: otpActionType ?? this.otpActionType,
//       );

//   factory SendOTPAPI.fromRawJson(String str) =>
//       SendOTPAPI.fromJson(json.decode(str));

//   String toRawJson() => json.encode(toJson());

//   factory SendOTPAPI.fromJson(Map<String, dynamic> json) => SendOTPAPI(
//         userUuid: json["userUuid"],
//         otpActionType: json["otpActionType"],
//       );

//   Map<String, dynamic> toJson() => {
//         "userUuid": userUuid,
//         "otpActionType": otpActionType,
//       };
// }

class CreateAccountResponse {
  final String otp;
  final OtpActionType otpActionType;
  final String pinId;
  final String userUuid;

  CreateAccountResponse({
    required this.otp,
    required this.otpActionType,
    required this.pinId,
    required this.userUuid,
  });

  CreateAccountResponse copyWith({
    String? otp,
    OtpActionType? otpActionType,
    String? pinId,
    String? userUuid,
  }) =>
      CreateAccountResponse(
        otp: otp ?? this.otp,
        otpActionType: otpActionType ?? this.otpActionType,
        pinId: pinId ?? this.pinId,
        userUuid: userUuid ?? this.userUuid,
      );

  factory CreateAccountResponse.fromRawJson(String str) =>
      CreateAccountResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CreateAccountResponse.fromJson(Map<String, dynamic> json) =>
      CreateAccountResponse(
        otp: json["otp"],
        otpActionType: otpActionTypeValues.map[json["otpActionType"]]!,
        pinId: json["pinId"],
        userUuid: json["userUuid"],
      );

  Map<String, dynamic> toJson() => {
        "otp": otp,
        "otpActionType": otpActionTypeValues.reverse[otpActionType],
        "pinId": pinId,
        "userUuid": userUuid,
      };
}

class VerifyOTPRequest {
  final String otp;
  final OtpActionType otpActionType;
  final String pinId;
  final String userUuid;

  VerifyOTPRequest({
    required this.otp,
    required this.otpActionType,
    required this.pinId,
    required this.userUuid,
  });

  VerifyOTPRequest copyWith({
    String? otp,
    OtpActionType? otpActionType,
    String? pinId,
    String? userUuid,
  }) =>
      VerifyOTPRequest(
        otp: otp ?? this.otp,
        otpActionType: otpActionType ?? this.otpActionType,
        pinId: pinId ?? this.pinId,
        userUuid: userUuid ?? this.userUuid,
      );

  factory VerifyOTPRequest.fromRawJson(String str) =>
      VerifyOTPRequest.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory VerifyOTPRequest.fromJson(Map<String, dynamic> json) =>
      VerifyOTPRequest(
        otp: json["otp"],
        otpActionType: otpActionTypeValues.map[json["otpActionType"]]!,
        pinId: json["pinId"],
        userUuid: json["userUuid"],
      );

  Map<String, dynamic> toJson() => {
        "otp": otp,
        "otpActionType": otpActionTypeValues.reverse[otpActionType],
        "pinId": pinId,
        "userUuid": userUuid,
      };
}

enum OtpActionType { RESET_PASSWORD, VERIFY_ACCOUNT }

final otpActionTypeValues = EnumValues({
  "RESET_PASSWORD": OtpActionType.RESET_PASSWORD,
  "VERIFY_ACCOUNT": OtpActionType.VERIFY_ACCOUNT
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

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

enum Role { MANAGER, USER }

final roleValues = EnumValues({"MANAGER": Role.MANAGER, "USER": Role.USER});

// class EnumValues<T> {
//   Map<String, T> map;
//   late Map<T, String> reverseMap;

//   EnumValues(this.map);

//   Map<T, String> get reverse {
//     reverseMap = map.map((k, v) => MapEntry(v, k));
//     return reverseMap;
//   }
// }

class SendOTPRequest {
  final OtpActionType otpActionType;
  final String userUuid;
  final String pinId;
  final String otp;

  SendOTPRequest({
    required this.otpActionType,
    required this.userUuid,
    required this.pinId,
    required this.otp,
  });

  SendOTPRequest copyWith({
    OtpActionType? otpActionType,
    String? userUuid,
    String? pinId,
    String? otp,
  }) =>
      SendOTPRequest(
        otpActionType: otpActionType ?? this.otpActionType,
        userUuid: userUuid ?? this.userUuid,
        pinId: pinId ?? this.pinId,
        otp: otp ?? this.otp,
      );

  factory SendOTPRequest.fromRawJson(String str) =>
      SendOTPRequest.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SendOTPRequest.fromJson(Map<String, dynamic> json) => SendOTPRequest(
        otpActionType: otpActionTypeValues.map[json["otpActionType"]]!,
        userUuid: json["userUuid"],
        pinId: json["pinId"],
        otp: json["otp"],
      );

  Map<String, dynamic> toJson() => {
        "otpActionType": otpActionTypeValues.reverse[otpActionType],
        "userUuid": userUuid,
        "pinId": pinId,
        "otp": otp,
      };
}

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
