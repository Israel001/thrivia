import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:thrivia_app/app/app.locator.dart';
import 'package:thrivia_app/app/app.logger.dart';
import 'package:thrivia_app/app/app.router.dart';
import 'package:thrivia_app/feat_auth/services/auth_service.dart';
import 'package:thrivia_app/feat_auth/ui/forgot_password/forgot_password_view.form.dart';

class ForgotPasswordViewModel extends FormViewModel {
  final _authService = locator<AuthService>();
  final _navigationService = locator<NavigationService>();
  final logger = getLogger("ForgotPasswordViewModel");

  final PageController controller = PageController();
  void resetPassword() async {
    logger.v("reset password button pressed");

    // validateForm();
    setValidationMessages({
      EmailPhoneNumberValueKey: getValidationMessage(EmailPhoneNumberValueKey),
    });

    if (hasAnyValidationMessage) {
      logger.v("email-phonenumber has validation errors - return");
      return;
    }

    await runBusyFuture(_authService.resetPassword(emailPhoneNumberValue!));

    if (hasError) {
      return;
    }
    final otpValid = await runBusyFuture(
        _navigationService.navigateToOtpView(timerStarted: true),
        busyObject: null);
    if (otpValid) {
      controller.nextPage(duration: Durations.medium1, curve: Curves.easeIn);
    }
  }
}
