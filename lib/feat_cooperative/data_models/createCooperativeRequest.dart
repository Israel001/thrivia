import 'dart:convert';

class CreateCooperativeRequest {
  final String name;
  final String regNo;
  final String address;
  final String contactEmail;
  final String contactPhone;
  final String bankName;
  final String bankCode;
  final String accountNo;
  final String accountName;

  CreateCooperativeRequest({
    required this.name,
    required this.regNo,
    required this.address,
    required this.contactEmail,
    required this.contactPhone,
    required this.bankName,
    required this.bankCode,
    required this.accountNo,
    required this.accountName,
  });

  CreateCooperativeRequest copyWith({
    String? name,
    String? regNo,
    String? address,
    String? contactEmail,
    String? contactPhone,
    String? bankName,
    String? bankCode,
    String? accountNo,
    String? accountName,
  }) =>
      CreateCooperativeRequest(
        name: name ?? this.name,
        regNo: regNo ?? this.regNo,
        address: address ?? this.address,
        contactEmail: contactEmail ?? this.contactEmail,
        contactPhone: contactPhone ?? this.contactPhone,
        bankName: bankName ?? this.bankName,
        bankCode: bankCode ?? this.bankCode,
        accountNo: accountNo ?? this.accountNo,
        accountName: accountName ?? this.accountName,
      );

  factory CreateCooperativeRequest.fromRawJson(String str) =>
      CreateCooperativeRequest.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CreateCooperativeRequest.fromJson(Map<String, dynamic> json) =>
      CreateCooperativeRequest(
        name: json["name"],
        regNo: json["regNo"],
        address: json["address"],
        contactEmail: json["contactEmail"],
        contactPhone: json["contactPhone"],
        bankName: json["bankName"],
        bankCode: json["bankCode"],
        accountNo: json["accountNo"],
        accountName: json["accountName"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "regNo": regNo,
        "address": address,
        "contactEmail": contactEmail,
        "contactPhone": contactPhone,
        "bankName": bankName,
        "bankCode": bankCode,
        "accountNo": accountNo,
        "accountName": accountName,
      };
}
