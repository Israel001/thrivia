import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:thrivia_app/app/app.logger.dart';
import 'package:thrivia_app/app/app.router.dart';
import 'package:thrivia_app/common/form_validators.dart';
import 'package:thrivia_app/feat_auth/data_models/enums.dart';
import 'package:thrivia_app/feat_auth/data_models/login_user_request.dart';
import 'package:thrivia_app/feat_auth/ui/create_account/create_account_viewmodel.dart';
import 'package:thrivia_app/feat_auth/ui/login/login_view.form.dart';

import '../../../app/app.locator.dart';
import '../../services/auth_service.dart';

class LoginViewModel extends FormViewModel {
  final _authService = locator<AuthService>();
  final _navigationService = locator<NavigationService>();
  final logger = getLogger("LoginViewModel");
  void buttonPress() {
    logger.v("login button pressed");
    validateForm();

    if (hasAnyValidationMessage) {
      logger.v("form has validation errors - return");
      return;
    }

    runBusyFuture(_login());
  }

  _login() async {
    logger.v("Login user");
    await _authService.loginUser(
      emailOrPhone: emailPhoneNumberValue!,
      password: passwordValue!,
    );

    if (_authService.goToOTPScreen) {
      _navigationService.navigateToOtpView(timerStarted: true);
      return;
    }

    if (_authService.authState == AuthState.loggedIn) {
      _navigationService.replaceWith(Routes.bottomNavView);
      return;
    }
  }

  void forgotPassword() {}
}
