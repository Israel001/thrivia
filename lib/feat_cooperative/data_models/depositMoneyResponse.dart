import 'package:meta/meta.dart';
import 'package:thrivia_app/feat_auth/data_models/data_models.dart';
import 'package:thrivia_app/feat_auth/data_models/user.dart';
import 'package:thrivia_app/feat_cooperative/data_models/data_models.dart';
import 'dart:convert';

import 'package:thrivia_app/feat_cooperative/data_models/wallet.dart';

class DepositMoneyResponse {
  final String uuid;
  final String type;
  final int balanceBefore;
  final int balanceAfter;
  final int amount;
  final Wallet wallet;
  final User user;
  final Payment payment;
  final String walletSnapshot;
  final String remark;
  final bool locked;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime deletedAt;

  DepositMoneyResponse({
    required this.uuid,
    required this.type,
    required this.balanceBefore,
    required this.balanceAfter,
    required this.amount,
    required this.wallet,
    required this.user,
    required this.payment,
    required this.walletSnapshot,
    required this.remark,
    required this.locked,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  DepositMoneyResponse copyWith({
    String? uuid,
    String? type,
    int? balanceBefore,
    int? balanceAfter,
    int? amount,
    Wallet? wallet,
    User? user,
    Payment? payment,
    String? walletSnapshot,
    String? remark,
    bool? locked,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
  }) =>
      DepositMoneyResponse(
        uuid: uuid ?? this.uuid,
        type: type ?? this.type,
        balanceBefore: balanceBefore ?? this.balanceBefore,
        balanceAfter: balanceAfter ?? this.balanceAfter,
        amount: amount ?? this.amount,
        wallet: wallet ?? this.wallet,
        user: user ?? this.user,
        payment: payment ?? this.payment,
        walletSnapshot: walletSnapshot ?? this.walletSnapshot,
        remark: remark ?? this.remark,
        locked: locked ?? this.locked,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt ?? this.deletedAt,
      );

  factory DepositMoneyResponse.fromRawJson(String str) =>
      DepositMoneyResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DepositMoneyResponse.fromJson(Map<String, dynamic> json) =>
      DepositMoneyResponse(
        uuid: json["uuid"],
        type: json["type"],
        balanceBefore: json["balanceBefore"],
        balanceAfter: json["balanceAfter"],
        amount: json["amount"],
        wallet: Wallet.fromJson(json["wallet"]),
        user: User.fromJson(json["user"]),
        payment: Payment.fromJson(json["payment"]),
        walletSnapshot: json["walletSnapshot"],
        remark: json["remark"],
        locked: json["locked"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        deletedAt: DateTime.parse(json["deletedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "type": type,
        "balanceBefore": balanceBefore,
        "balanceAfter": balanceAfter,
        "amount": amount,
        "wallet": wallet.toJson(),
        "user": user.toJson(),
        "payment": payment.toJson(),
        "walletSnapshot": walletSnapshot,
        "remark": remark,
        "locked": locked,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "deletedAt": deletedAt.toIso8601String(),
      };
}
