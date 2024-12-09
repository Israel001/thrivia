import 'package:intl/intl.dart';

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

  static String? validateFullName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Please enter a valid name";
    }
    final names = value.split("");

    for (var name in names) {
      final validationMessage = validateName(name);
      if (validationMessage == null) {
        continue;
      }

      return validationMessage;
    }

    return null;
  }

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

  static String? validateAccountNumber(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter a valid account number";
    }

    if (_validateNumberOfLength(value, 11)) {
      return "Invalid account number";
    }
    return null;
  }

  static bool _validateNumberOfLength(
    String? value,
    int length,
  ) {
    if (value == null || value.isEmpty) {
      return false;
    }
    // This regex matches phone numbers with optional country code, area code, and allows for various formats
    final phoneRegex = RegExp(r'^[\d]{' "$length" r'}$');
    if (!phoneRegex.hasMatch(value)) {
      return false;
    }
    return true;
  }

  static String? validateBVNANDNIN(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter a valid value";
    }

    if (!_validateNumberOfLength(value, 11)) {
      return "Invalid input";
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter an email address";
    }
    // This regex matches most valid email formats
    final emailRegex = RegExp(r'^[\w-\.\+]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return "Invalid email format";
    }
    return null;
  }

  static String? validatePassword(String? value) {
    _currentPassword = value;
    if (value == null || value.isEmpty) {
      return "Please enter a valid pin";
    }

    if (value.length != 6) {
      return "Pin should be six digits";
    }

    if (!_validateNumberOfLength(value, 6)) {
      return "Invalid input";
    }

    return null;
  }

  static String? _currentPassword;

  static String? validateCooperativeId(String? value) {
    if (_validateNumberOfLength(value, 11)) {
      return null;
    } else {
      return "Invalid Id";
    }
  }

  static String? validateMembershipNumber(String? value) {
    if (_validateNumberOfLength(value, 11)) {
      return null;
    } else {
      return "Invalid Id";
    }
  }

  static String? validateDropDown(String? value) {
    if (value == null || value.isEmpty) {
      return "Please select a valid option";
    }
    return null;
  }

  static String? validateHouseAddress(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter an address";
    }
    final regex = RegExp(r'^[a-zA-Z0-9\s,.-]+$');

    final validAddress = regex.hasMatch(value);
    if (!validAddress) {
      return "Invalid address";
    }
    return null;
  }

  static String? validateConfirmPassword(String? value) {
    if (value != _currentPassword) {
      return "Passwords do not match";
    }
    return null;
  }

  static String? validateDateOfBirth(String? value) {
    if (value == null) {
      return "Please enter a valid date";
    }

    final regex = RegExp(r'^\d{4}-\d{1,2}-\d{1,2}$');
    final validDate = regex.hasMatch(value);

    if (!validDate) {
      return "Date is not valid";
    }

    final dateFragments = value.split("-");

    try {
      // Parse the date
      final dateFormat = DateFormat('y-M-d');
      // final parsedDate = dateFormat.parseStrict(value);
      final parsedDate = DateTime(int.parse(dateFragments[0]),
          int.parse(dateFragments[1]), int.parse(dateFragments[2]));

      // Get today's date
      final today = DateTime.now();
      // Calculate the valid date range
      final minDate = DateTime(today.year - 120, today.month, today.day);
      final maxDate = today.subtract(Duration(days: 1)); // Past dates only

      // Check if within valid range
      final dateInValidRange =
          parsedDate.isAfter(minDate) && parsedDate.isBefore(maxDate);
      if (!dateInValidRange) {
        return "Date is not valid";
      }
    } catch (e) {
      return "Date is not valid"; // If parsing fails
    }

    return null;
  }

  static String? validateEmailOrPhoneNumber(String? value) {
    final emailValidationMessage = FormValidators.validateEmail(value);
    final phoneNumberValidationMessage =
        FormValidators.validatePhoneNumber(value);

    final oneIsValid =
        emailValidationMessage == null || phoneNumberValidationMessage == null;

    if (oneIsValid) {
      return null;
    } else {
      return "Invalid input";
    }
  }

  static String? otpFieldValidator(String? value) {
    return null;
  }
}
