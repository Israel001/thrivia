import 'dart:convert';
import 'package:thrivia_app/feat_auth/data_models/enums.dart';
import 'package:thrivia_app/feat_auth/services/auth_service.dart';

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
