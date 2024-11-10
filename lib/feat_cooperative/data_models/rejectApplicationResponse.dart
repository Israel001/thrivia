import 'package:meta/meta.dart';
import 'dart:convert';

class RejectApplicationResponse {
  final String reason;

  RejectApplicationResponse({
    required this.reason,
  });

  RejectApplicationResponse copyWith({
    String? reason,
  }) =>
      RejectApplicationResponse(
        reason: reason ?? this.reason,
      );

  factory RejectApplicationResponse.fromRawJson(String str) =>
      RejectApplicationResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RejectApplicationResponse.fromJson(Map<String, dynamic> json) =>
      RejectApplicationResponse(
        reason: json["reason"],
      );

  Map<String, dynamic> toJson() => {
        "reason": reason,
      };
}
