import 'package:stacked/stacked.dart';
import 'package:thrivia_app/app/app.locator.dart';
import 'package:thrivia_app/services/auth_service.dart';
import 'package:thrivia_app/ui/views/create_account/create_account_view.form.dart';

class CreateAccountViewModel extends FormViewModel {
  final _authService = locator<AuthService>();

  _createAccount() {
    final createUser = CreateUserAPI(
        firstName: firstNameValue!,
        lastName: lastNameValue!,
        email: emailAddressValue!,
        phoneNumber: phoneNumberValue!,
        password: pinValue!,
        bvn: bvnValue!,
        nin: ninValue!);
    _authService.createAccount(createUser);
  }

  void buttonPress() {
    final formValid = validateForm();
    if (hasAnyValidationMessage) {
      return;
    }
    _createAccount();
  }
}

abstract class FormValidators {
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
    final phoneRegex = RegExp(r'^\+?[\d\s()-]{11}$');
    if (!phoneRegex.hasMatch(value)) {
      return "Invalid phone number format";
    }
    return null;
  }

  static String? validateBVNANDNIN(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter a valid value";
    }
    // This regex matches phone numbers with optional country code, area code, and allows for various formats
    final phoneRegex = RegExp(r'^\+?[\d\s()-]{11}$');
    if (!phoneRegex.hasMatch(value)) {
      return "Invalid input";
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
      return "Please enter a valid pin";
    }
    // This regex matches phone numbers with optional country code, area code, and allows for various formats
    final phoneRegex = RegExp(r'^\+?[\d\s()-]{11}$');
    if (!phoneRegex.hasMatch(value)) {
      return "Invalid input";
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