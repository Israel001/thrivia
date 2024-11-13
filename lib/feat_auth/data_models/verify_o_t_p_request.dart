import 'dart:convert';
import 'package:thrivia_app/feat_auth/data_models/enums.dart';
import 'package:thrivia_app/feat_auth/services/auth_service.dart';

class VerifyOTPBody {
  final String? otp;
  final OtpActionType otpActionType;
  final String pinId;
  final String userUuid;

  VerifyOTPBody({
    required this.otp,
    required this.otpActionType,
    required this.pinId,
    required this.userUuid,
  });

  VerifyOTPBody copyWith({
    String? otp,
    OtpActionType? otpActionType,
    String? pinId,
    String? userUuid,
  }) =>
      VerifyOTPBody(
        otp: otp ?? this.otp,
        otpActionType: otpActionType ?? this.otpActionType,
        pinId: pinId ?? this.pinId,
        userUuid: userUuid ?? this.userUuid,
      );

  factory VerifyOTPBody.fromRawJson(String str) =>
      VerifyOTPBody.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory VerifyOTPBody.fromJson(Map<String, dynamic> json) => VerifyOTPBody(
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
