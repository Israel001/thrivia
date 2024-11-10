import 'package:meta/meta.dart';
import 'dart:convert';

class Payment {
  final String uuid;
  final String transactionId;
  final String status;
  final int amount;
  final String channel;
  final String metadata;
  final String type;
  final String currencies;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime deletedAt;

  Payment({
    required this.uuid,
    required this.transactionId,
    required this.status,
    required this.amount,
    required this.channel,
    required this.metadata,
    required this.type,
    required this.currencies,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  Payment copyWith({
    String? uuid,
    String? transactionId,
    String? status,
    int? amount,
    String? channel,
    String? metadata,
    String? type,
    String? currencies,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
  }) =>
      Payment(
        uuid: uuid ?? this.uuid,
        transactionId: transactionId ?? this.transactionId,
        status: status ?? this.status,
        amount: amount ?? this.amount,
        channel: channel ?? this.channel,
        metadata: metadata ?? this.metadata,
        type: type ?? this.type,
        currencies: currencies ?? this.currencies,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt ?? this.deletedAt,
      );

  factory Payment.fromRawJson(String str) => Payment.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
        uuid: json["uuid"],
        transactionId: json["transactionId"],
        status: json["status"],
        amount: json["amount"],
        channel: json["channel"],
        metadata: json["metadata"],
        type: json["type"],
        currencies: json["currencies"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        deletedAt: DateTime.parse(json["deletedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "transactionId": transactionId,
        "status": status,
        "amount": amount,
        "channel": channel,
        "metadata": metadata,
        "type": type,
        "currencies": currencies,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "deletedAt": deletedAt.toIso8601String(),
      };
}
