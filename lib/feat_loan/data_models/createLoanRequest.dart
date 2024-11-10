import 'package:meta/meta.dart';
import 'dart:convert';

class CreateLoanRequest {
  final int amount;
  final String cooperativeUuid;
  final String bankCode;
  final String bankName;
  final String accountNumber;
  final String accountName;
  final String purpose;

  CreateLoanRequest({
    required this.amount,
    required this.cooperativeUuid,
    required this.bankCode,
    required this.bankName,
    required this.accountNumber,
    required this.accountName,
    required this.purpose,
  });

  CreateLoanRequest copyWith({
    int? amount,
    String? cooperativeUuid,
    String? bankCode,
    String? bankName,
    String? accountNumber,
    String? accountName,
    String? purpose,
  }) =>
      CreateLoanRequest(
        amount: amount ?? this.amount,
        cooperativeUuid: cooperativeUuid ?? this.cooperativeUuid,
        bankCode: bankCode ?? this.bankCode,
        bankName: bankName ?? this.bankName,
        accountNumber: accountNumber ?? this.accountNumber,
        accountName: accountName ?? this.accountName,
        purpose: purpose ?? this.purpose,
      );

  factory CreateLoanRequest.fromRawJson(String str) =>
      CreateLoanRequest.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CreateLoanRequest.fromJson(Map<String, dynamic> json) =>
      CreateLoanRequest(
        amount: json["amount"],
        cooperativeUuid: json["cooperativeUuid"],
        bankCode: json["bankCode"],
        bankName: json["bankName"],
        accountNumber: json["accountNumber"],
        accountName: json["accountName"],
        purpose: json["purpose"],
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "cooperativeUuid": cooperativeUuid,
        "bankCode": bankCode,
        "bankName": bankName,
        "accountNumber": accountNumber,
        "accountName": accountName,
        "purpose": purpose,
      };
}
