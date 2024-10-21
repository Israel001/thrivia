import 'dart:convert';
import 'package:thrivia_app/feat_auth/data_models/enums.dart';
import 'package:thrivia_app/feat_auth/services/auth_service.dart';

class SendOTPRequest {
  final OtpActionType otpActionType;
  final String userUuid;

  SendOTPRequest({
    required this.otpActionType,
    required this.userUuid,
  });

  SendOTPRequest copyWith({
    OtpActionType? otpActionType,
    String? userUuid,
  }) =>
      SendOTPRequest(
        otpActionType: otpActionType ?? this.otpActionType,
        userUuid: userUuid ?? this.userUuid,
      );

  factory SendOTPRequest.fromRawJson(String str) =>
      SendOTPRequest.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SendOTPRequest.fromJson(Map<String, dynamic> json) => SendOTPRequest(
        otpActionType: otpActionTypeValues.map[json["otpActionType"]]!,
        userUuid: json["userUuid"],
      );

  Map<String, dynamic> toJson() => {
        "otpActionType": otpActionTypeValues.reverse[otpActionType],
        "userUuid": userUuid,
      };
}
