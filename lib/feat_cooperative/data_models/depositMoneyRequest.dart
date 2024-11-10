import 'package:meta/meta.dart';
import 'dart:convert';

class DepositMoneyRequest {
  final String paymentUuid;

  DepositMoneyRequest({
    required this.paymentUuid,
  });

  DepositMoneyRequest copyWith({
    String? paymentUuid,
  }) =>
      DepositMoneyRequest(
        paymentUuid: paymentUuid ?? this.paymentUuid,
      );

  factory DepositMoneyRequest.fromRawJson(String str) =>
      DepositMoneyRequest.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DepositMoneyRequest.fromJson(Map<String, dynamic> json) =>
      DepositMoneyRequest(
        paymentUuid: json["paymentUuid"],
      );

  Map<String, dynamic> toJson() => {
        "paymentUuid": paymentUuid,
      };
}
