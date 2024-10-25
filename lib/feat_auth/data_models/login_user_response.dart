import 'dart:convert';

class LoginResponse {
  final String accessToken;
  final int expiresIn;
  final String refreshToken;
  final User user;

  LoginResponse({
    required this.accessToken,
    required this.expiresIn,
    required this.refreshToken,
    required this.user,
  });

  LoginResponse copyWith({
    String? accessToken,
    int? expiresIn,
    String? refreshToken,
    User? user,
  }) =>
      LoginResponse(
        accessToken: accessToken ?? this.accessToken,
        expiresIn: expiresIn ?? this.expiresIn,
        refreshToken: refreshToken ?? this.refreshToken,
        user: user ?? this.user,
      );

  factory LoginResponse.fromRawJson(String str) =>
      LoginResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        accessToken: json["accessToken"],
        expiresIn: json["expiresIn"],
        refreshToken: json["refreshToken"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "accessToken": accessToken,
        "expiresIn": expiresIn,
        "refreshToken": refreshToken,
        "user": user.toJson(),
      };
}

class User {
  final String uuid;
  final String? deletedAt;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String email;
  final String? membershipNo;
  final String? dateOfBirth;
  final String? address;
  final bool phoneVerified;
  final DateTime lastLoggedIn;
  final String? incomeSource;
  final String? employmentDetails;
  final String? additionalDetails;
  final String bvn;
  final String nin;
  final String accountName;
  final String accountReference;
  final String bankAccounts;
  final String providerResponse;
  final dynamic activeCooperative;

  User({
    required this.uuid,
    required this.deletedAt,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.email,
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
  });

  User copyWith({
    String? uuid,
    dynamic deletedAt,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? email,
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
    dynamic activeCooperative,
  }) =>
      User(
        uuid: uuid ?? this.uuid,
        deletedAt: deletedAt ?? this.deletedAt,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        email: email ?? this.email,
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
      );

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
        uuid: json["uuid"],
        deletedAt: json["deletedAt"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        phoneNumber: json["phoneNumber"],
        email: json["email"],
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
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "deletedAt": deletedAt,
        "firstName": firstName,
        "lastName": lastName,
        "phoneNumber": phoneNumber,
        "email": email,
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
      };
}
