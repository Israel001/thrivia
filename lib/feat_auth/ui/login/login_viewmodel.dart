import 'package:stacked/stacked.dart';
import 'package:thrivia_app/feat_auth/ui/create_account/create_account_viewmodel.dart';
import 'package:thrivia_app/feat_auth/ui/login/login_view.form.dart';

import '../../../app/app.locator.dart';
import '../../services/auth_service.dart';

class LoginViewModel extends FormViewModel {
  final _authService = locator<AuthService>();
  void buttonPress() {
    validateForm();

    if (hasAnyValidationMessage) {
      return;
    }

    _login();
  }

  _login() {
    throw UnimplementedError();
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
}
