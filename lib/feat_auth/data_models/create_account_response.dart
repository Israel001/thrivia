import 'dart:convert';
import 'package:thrivia_app/feat_auth/data_models/enums.dart';

class CreateAccountResponse {
  final String pinId;
  final String uuid;

  CreateAccountResponse({
    required this.pinId,
    required this.uuid,
  });

  CreateAccountResponse copyWith({
    String? otp,
    OtpActionType? otpActionType,
    String? pinId,
    String? uuid,
  }) =>
      CreateAccountResponse(
        pinId: pinId ?? this.pinId,
        uuid: uuid ?? this.uuid,
      );

  factory CreateAccountResponse.fromRawJson(String str) =>
      CreateAccountResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CreateAccountResponse.fromJson(Map<String, dynamic> json) =>
      CreateAccountResponse(
        pinId: json["pinId"],
        uuid: json["uuid"],
      );

  Map<String, dynamic> toJson() => {
        "pinId": pinId,
        "uuid": uuid,
      };
}
