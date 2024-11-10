import 'package:meta/meta.dart';
import 'dart:convert';

class PaymentInfoRequest {
  final int amount;

  PaymentInfoRequest({
    required this.amount,
  });

  PaymentInfoRequest copyWith({
    int? amount,
  }) =>
      PaymentInfoRequest(
        amount: amount ?? this.amount,
      );

  factory PaymentInfoRequest.fromRawJson(String str) =>
      PaymentInfoRequest.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PaymentInfoRequest.fromJson(Map<String, dynamic> json) =>
      PaymentInfoRequest(
        amount: json["amount"],
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
      };
}
