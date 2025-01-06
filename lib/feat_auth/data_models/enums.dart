enum OtpActionType { RESET_PASSWORD, VERIFY_ACCOUNT }

final otpActionTypeValues = EnumValues({
  "RESET_PASSWORD": OtpActionType.RESET_PASSWORD,
  "VERIFY_ACCOUNT": OtpActionType.VERIFY_ACCOUNT
});

enum Role { MANAGER, MEMBER }

final roleValues = EnumValues({"MANAGER": Role.MANAGER, "MEMBER": Role.MEMBER});

enum AuthState {
  loggedIn,
  logggedOut,
  pendingVerifyOTP,
  pendingPasswordResetOTP,
  validPasswordResetOTP,
  newUser
}

enum LoanStatus { pending, active, rejected, cancelled, closed, overdue }

final loanStatusValues = EnumValues({
  "PENDING": LoanStatus.pending,
  "ACTIVE": LoanStatus.active,
  "REJECTED": LoanStatus.rejected,
  "CANCELLED": LoanStatus.cancelled,
  "CLOSED": LoanStatus.closed,
  "OVERDUE": LoanStatus.overdue
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
