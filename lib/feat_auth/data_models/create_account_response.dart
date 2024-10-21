import 'dart:convert';
import 'package:thrivia_app/feat_auth/data_models/enums.dart';
import 'package:thrivia_app/feat_auth/services/auth_service.dart';

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
