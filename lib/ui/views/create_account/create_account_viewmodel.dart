import 'package:stacked/stacked.dart';

class CreateAccountViewModel extends FormViewModel {}

class FormValidators {
  // static String? firstNameET,
  //     lastNameET,
  //     phoneET,
  //     emailET,
  //     passwordET,
  //     confirmPasswordET;

  static String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Please enter a valid name";
    }
    return null;
  }

  // static String? validateFirstName(String? value) {
  //   final errorText = _validateName(value);
  //   firstNameET = errorText;
  //   return errorText;
  // }

  // static String? validateLastName(String? value) {
  //   return _validateName(value);
  // }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter a valid phone number";
    }
    // This regex matches phone numbers with optional country code, area code, and allows for various formats
    final phoneRegex = RegExp(r'^\+?[\d\s()-]{10,}$');
    if (!phoneRegex.hasMatch(value)) {
      return "Invalid phone number format";
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter an email address";
    }
    // This regex matches most valid email formats
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return "Invalid email format";
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter a password";
    }
    if (value.length < 8) {
      return "Password must be at least 8 characters long";
    }
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return "Password must contain at least one uppercase letter";
    }
    if (!value.contains(RegExp(r'[a-z]'))) {
      return "Password must contain at least one lowercase letter";
    }
    if (!value.contains(RegExp(r'[0-9]'))) {
      return "Password must contain at least one number";
    }
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return "Password must contain at least one special character";
    }
    _currentPassword = value;
    return null;
  }

  static String? _currentPassword;
  static String? validateConfirmPassword(String? value) {
    if (value != _currentPassword) {
      return "Passwords do not match";
    }
    return null;
  }
}
