import 'package:meta/meta.dart';
import 'dart:convert';

class Cooperative {
  final String uuid;
  final String name;
  final String regNo;
  final String address;
  final String contactEmail;
  final String contactPhone;
  final String bankName;
  final String bankCode;
  final String accountNo;
  final String accountName;
  final String uniqueId;
  final String slug;
  final String profilePic;
  final CreatedBy createdBy;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime deletedAt;

  Cooperative({
    required this.uuid,
    required this.name,
    required this.regNo,
    required this.address,
    required this.contactEmail,
    required this.contactPhone,
    required this.bankName,
    required this.bankCode,
    required this.accountNo,
    required this.accountName,
    required this.uniqueId,
    required this.slug,
    required this.profilePic,
    required this.createdBy,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  Cooperative copyWith({
    String? uuid,
    String? name,
    String? regNo,
    String? address,
    String? contactEmail,
    String? contactPhone,
    String? bankName,
    String? bankCode,
    String? accountNo,
    String? accountName,
    String? uniqueId,
    String? slug,
    String? profilePic,
    CreatedBy? createdBy,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
  }) =>
      Cooperative(
        uuid: uuid ?? this.uuid,
        name: name ?? this.name,
        regNo: regNo ?? this.regNo,
        address: address ?? this.address,
        contactEmail: contactEmail ?? this.contactEmail,
        contactPhone: contactPhone ?? this.contactPhone,
        bankName: bankName ?? this.bankName,
        bankCode: bankCode ?? this.bankCode,
        accountNo: accountNo ?? this.accountNo,
        accountName: accountName ?? this.accountName,
        uniqueId: uniqueId ?? this.uniqueId,
        slug: slug ?? this.slug,
        profilePic: profilePic ?? this.profilePic,
        createdBy: createdBy ?? this.createdBy,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt ?? this.deletedAt,
      );

  factory Cooperative.fromRawJson(String str) =>
      Cooperative.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Cooperative.fromJson(Map<String, dynamic> json) => Cooperative(
        uuid: json["uuid"],
        name: json["name"],
        regNo: json["regNo"],
        address: json["address"],
        contactEmail: json["contactEmail"],
        contactPhone: json["contactPhone"],
        bankName: json["bankName"],
        bankCode: json["bankCode"],
        accountNo: json["accountNo"],
        accountName: json["accountName"],
        uniqueId: json["uniqueId"],
        slug: json["slug"],
        profilePic: json["profilePic"],
        createdBy: CreatedBy.fromJson(json["createdBy"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        deletedAt: DateTime.parse(json["deletedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "name": name,
        "regNo": regNo,
        "address": address,
        "contactEmail": contactEmail,
        "contactPhone": contactPhone,
        "bankName": bankName,
        "bankCode": bankCode,
        "accountNo": accountNo,
        "accountName": accountName,
        "uniqueId": uniqueId,
        "slug": slug,
        "profilePic": profilePic,
        "createdBy": createdBy.toJson(),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "deletedAt": deletedAt.toIso8601String(),
      };
}

class CreatedBy {
  final String uuid;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String email;
  final String password;
  final String membershipNo;
  final String dateOfBirth;
  final String address;
  final bool phoneVerified;
  final DateTime lastLoggedIn;
  final String incomeSource;
  final String employmentDetails;
  final String additionalDetails;
  final String bvn;
  final String nin;
  final String accountName;
  final String accountReference;
  final String bankAccounts;
  final String providerResponse;
  final String activeCooperative;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime deletedAt;

  CreatedBy({
    required this.uuid,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.email,
    required this.password,
    required this.membershipNo,
    required this.dateOfBirth,
    required this.address,
    required this.phoneVerified,
    required this.lastLoggedIn,
    required this.incomeSource,
    required this.employmentDetails,
    required this.additionalDetails,
    required this.bvn,
    required this.nin,
    required this.accountName,
    required this.accountReference,
    required this.bankAccounts,
    required this.providerResponse,
    required this.activeCooperative,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  CreatedBy copyWith({
    String? uuid,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? email,
    String? password,
    String? membershipNo,
    String? dateOfBirth,
    String? address,
    bool? phoneVerified,
    DateTime? lastLoggedIn,
    String? incomeSource,
    String? employmentDetails,
    String? additionalDetails,
    String? bvn,
    String? nin,
    String? accountName,
    String? accountReference,
    String? bankAccounts,
    String? providerResponse,
    String? activeCooperative,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
  }) =>
      CreatedBy(
        uuid: uuid ?? this.uuid,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        email: email ?? this.email,
        password: password ?? this.password,
        membershipNo: membershipNo ?? this.membershipNo,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        address: address ?? this.address,
        phoneVerified: phoneVerified ?? this.phoneVerified,
        lastLoggedIn: lastLoggedIn ?? this.lastLoggedIn,
        incomeSource: incomeSource ?? this.incomeSource,
        employmentDetails: employmentDetails ?? this.employmentDetails,
        additionalDetails: additionalDetails ?? this.additionalDetails,
        bvn: bvn ?? this.bvn,
        nin: nin ?? this.nin,
        accountName: accountName ?? this.accountName,
        accountReference: accountReference ?? this.accountReference,
        bankAccounts: bankAccounts ?? this.bankAccounts,
        providerResponse: providerResponse ?? this.providerResponse,
        activeCooperative: activeCooperative ?? this.activeCooperative,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt ?? this.deletedAt,
      );

  factory CreatedBy.fromRawJson(String str) =>
      CreatedBy.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CreatedBy.fromJson(Map<String, dynamic> json) => CreatedBy(
        uuid: json["uuid"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        phoneNumber: json["phoneNumber"],
        email: json["email"],
        password: json["password"],
        membershipNo: json["membershipNo"],
        dateOfBirth: json["dateOfBirth"],
        address: json["address"],
        phoneVerified: json["phoneVerified"],
        lastLoggedIn: DateTime.parse(json["lastLoggedIn"]),
        incomeSource: json["incomeSource"],
        employmentDetails: json["employmentDetails"],
        additionalDetails: json["additionalDetails"],
        bvn: json["bvn"],
        nin: json["nin"],
        accountName: json["accountName"],
        accountReference: json["accountReference"],
        bankAccounts: json["bankAccounts"],
        providerResponse: json["providerResponse"],
        activeCooperative: json["activeCooperative"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        deletedAt: DateTime.parse(json["deletedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "firstName": firstName,
        "lastName": lastName,
        "phoneNumber": phoneNumber,
        "email": email,
        "password": password,
        "membershipNo": membershipNo,
        "dateOfBirth": dateOfBirth,
        "address": address,
        "phoneVerified": phoneVerified,
        "lastLoggedIn": lastLoggedIn.toIso8601String(),
        "incomeSource": incomeSource,
        "employmentDetails": employmentDetails,
        "additionalDetails": additionalDetails,
        "bvn": bvn,
        "nin": nin,
        "accountName": accountName,
        "accountReference": accountReference,
        "bankAccounts": bankAccounts,
        "providerResponse": providerResponse,
        "activeCooperative": activeCooperative,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "deletedAt": deletedAt.toIso8601String(),
      };
}
