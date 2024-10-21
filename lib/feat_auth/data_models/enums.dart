enum OtpActionType { RESET_PASSWORD, VERIFY_ACCOUNT }

final otpActionTypeValues = EnumValues({
  "RESET_PASSWORD": OtpActionType.RESET_PASSWORD,
  "VERIFY_ACCOUNT": OtpActionType.VERIFY_ACCOUNT
});

enum Role { MANAGER, USER }

final roleValues = EnumValues({"MANAGER": Role.MANAGER, "USER": Role.USER});

enum AuthState { loggedIn, logggedOut, pendingOTP, newUser }

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
