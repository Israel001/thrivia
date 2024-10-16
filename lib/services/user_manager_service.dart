class UserManagerService {
  UserType _userType = UserType.member;

  UserType get userType => _userType;
  set userType(UserType userType) => _userType = userType;
}

enum UserType { owner, member }
