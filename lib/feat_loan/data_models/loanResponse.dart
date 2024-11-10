import 'package:meta/meta.dart';
import 'package:thrivia_app/feat_auth/data_models/data_models.dart';
import 'package:thrivia_app/feat_auth/data_models/user.dart';
import 'package:thrivia_app/feat_cooperative/data_models/data_models.dart';
import 'dart:convert';

import 'package:thrivia_app/feat_cooperative/data_models/depositMoneyResponse.dart';

class LoanResponse {
  final String uuid;
  final int requestedAmount;
  final int balance;
  final DateTime startDate;
  final DateTime endDate;
  final String status;
  final User reviewedBy;
  final String rejectionReason;
  final String cancellationReason;
  final DateTime reviewedAt;
  final String bankName;
  final String bankCode;
  final String accountNumber;
  final String accountName;
  final String purpose;
  final User user;
  final Cooperative cooperative;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime deletedAt;

  LoanResponse({
    required this.uuid,
    required this.requestedAmount,
    required this.balance,
    required this.startDate,
    required this.endDate,
    required this.status,
    required this.reviewedBy,
    required this.rejectionReason,
    required this.cancellationReason,
    required this.reviewedAt,
    required this.bankName,
    required this.bankCode,
    required this.accountNumber,
    required this.accountName,
    required this.purpose,
    required this.user,
    required this.cooperative,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  LoanResponse copyWith({
    String? uuid,
    int? requestedAmount,
    int? balance,
    DateTime? startDate,
    DateTime? endDate,
    String? status,
    User? reviewedBy,
    String? rejectionReason,
    String? cancellationReason,
    DateTime? reviewedAt,
    String? bankName,
    String? bankCode,
    String? accountNumber,
    String? accountName,
    String? purpose,
    User? user,
    Cooperative? cooperative,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
  }) =>
      LoanResponse(
        uuid: uuid ?? this.uuid,
        requestedAmount: requestedAmount ?? this.requestedAmount,
        balance: balance ?? this.balance,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        status: status ?? this.status,
        reviewedBy: reviewedBy ?? this.reviewedBy,
        rejectionReason: rejectionReason ?? this.rejectionReason,
        cancellationReason: cancellationReason ?? this.cancellationReason,
        reviewedAt: reviewedAt ?? this.reviewedAt,
        bankName: bankName ?? this.bankName,
        bankCode: bankCode ?? this.bankCode,
        accountNumber: accountNumber ?? this.accountNumber,
        accountName: accountName ?? this.accountName,
        purpose: purpose ?? this.purpose,
        user: user ?? this.user,
        cooperative: cooperative ?? this.cooperative,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt ?? this.deletedAt,
      );

  factory LoanResponse.fromRawJson(String str) =>
      LoanResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LoanResponse.fromJson(Map<String, dynamic> json) => LoanResponse(
        uuid: json["uuid"],
        requestedAmount: json["requestedAmount"],
        balance: json["balance"],
        startDate: DateTime.parse(json["startDate"]),
        endDate: DateTime.parse(json["endDate"]),
        status: json["status"],
        reviewedBy: User.fromJson(json["reviewedBy"]),
        rejectionReason: json["rejectionReason"],
        cancellationReason: json["cancellationReason"],
        reviewedAt: DateTime.parse(json["reviewedAt"]),
        bankName: json["bankName"],
        bankCode: json["bankCode"],
        accountNumber: json["accountNumber"],
        accountName: json["accountName"],
        purpose: json["purpose"],
        user: User.fromJson(json["user"]),
        cooperative: Cooperative.fromJson(json["cooperative"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        deletedAt: DateTime.parse(json["deletedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "requestedAmount": requestedAmount,
        "balance": balance,
        "startDate": startDate.toIso8601String(),
        "endDate": endDate.toIso8601String(),
        "status": status,
        "reviewedBy": reviewedBy.toJson(),
        "rejectionReason": rejectionReason,
        "cancellationReason": cancellationReason,
        "reviewedAt": reviewedAt.toIso8601String(),
        "bankName": bankName,
        "bankCode": bankCode,
        "accountNumber": accountNumber,
        "accountName": accountName,
        "purpose": purpose,
        "user": user.toJson(),
        "cooperative": cooperative.toJson(),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "deletedAt": deletedAt.toIso8601String(),
      };
}
