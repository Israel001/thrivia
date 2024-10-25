import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:thrivia_app/app/app.router.dart';
import 'package:thrivia_app/feat_auth/data_models/enums.dart';
import 'package:thrivia_app/feat_auth/data_models/login_user_request.dart';
import 'package:thrivia_app/feat_auth/ui/create_account/create_account_viewmodel.dart';
import 'package:thrivia_app/feat_auth/ui/login/login_view.form.dart';

import '../../../app/app.locator.dart';
import '../../services/auth_service.dart';

class LoginViewModel extends FormViewModel {
  final _authService = locator<AuthService>();
  final _navigationService = locator<NavigationService>();
  void buttonPress() {
    validateForm();

    if (hasAnyValidationMessage) {
      return;
    }

    _login();
  }

  _login() async {
    try {
      await _authService.loginUser(
        emailOrPhone: emailPhoneNumberValue!,
        password: passwordValue!,
      );

      if (_authService.goToOTPScreen) {
        _navigationService.navigateToOtpView();
        return;
      }
      if (_authService.authState == AuthState.loggedIn) {
        _navigationService.navigateTo(Routes.homeView);
        return;
      }
    } catch (e) {
      setValidationMessage(e.toString());
      notifyListeners();
    }
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
