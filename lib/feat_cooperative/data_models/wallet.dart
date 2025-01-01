import 'dart:convert';

import 'package:thrivia_app/feat_auth/data_models/login_user_response.dart';
import 'package:thrivia_app/feat_users/data_models/user.dart';
import 'package:thrivia_app/feat_cooperative/data_models/data_models.dart';

class Wallet {
  final String uuid;
  final String title;
  final int availableBalance;
  final int totalBalance;
  final Cooperative cooperative;
  final User user;
  final User createdBy;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime deletedAt;

  Wallet({
    required this.uuid,
    required this.title,
    required this.availableBalance,
    required this.totalBalance,
    required this.cooperative,
    required this.user,
    required this.createdBy,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  Wallet copyWith({
    String? uuid,
    String? title,
    int? availableBalance,
    int? totalBalance,
    Cooperative? cooperative,
    User? user,
    User? createdBy,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
  }) =>
      Wallet(
        uuid: uuid ?? this.uuid,
        title: title ?? this.title,
        availableBalance: availableBalance ?? this.availableBalance,
        totalBalance: totalBalance ?? this.totalBalance,
        cooperative: cooperative ?? this.cooperative,
        user: user ?? this.user,
        createdBy: createdBy ?? this.createdBy,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt ?? this.deletedAt,
      );

  factory Wallet.fromRawJson(String str) => Wallet.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Wallet.fromJson(Map<String, dynamic> json) => Wallet(
        uuid: json["uuid"],
        title: json["title"],
        availableBalance: json["availableBalance"],
        totalBalance: json["totalBalance"],
        cooperative: Cooperative.fromJson(json["cooperative"]),
        user: User.fromJson(json["user"]),
        createdBy: User.fromJson(json["createdBy"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        deletedAt: DateTime.parse(json["deletedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "title": title,
        "availableBalance": availableBalance,
        "totalBalance": totalBalance,
        "cooperative": cooperative.toJson(),
        "user": user.toJson(),
        "createdBy": createdBy.toJson(),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "deletedAt": deletedAt.toIso8601String(),
      };
}
