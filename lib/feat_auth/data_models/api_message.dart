import 'dart:convert';

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
