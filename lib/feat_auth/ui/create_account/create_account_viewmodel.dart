import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:thrivia_app/app/app.locator.dart';
import 'package:thrivia_app/app/app.logger.dart';
import 'package:thrivia_app/app/app.router.dart';
import 'package:thrivia_app/feat_auth/data_models/create_user_request.dart';
import 'package:thrivia_app/feat_auth/services/auth_service.dart';
import 'package:thrivia_app/feat_auth/ui/create_account/create_account_view.form.dart';

class CreateAccountViewModel extends FormViewModel {
  final _authService = locator<AuthService>();
  final _navigationService = locator<NavigationService>();
  final logger = getLogger("CreateAccountViewModel");

  Future<void> _createAccount() async {
    logger.i("Create account");
    final createUser = CreateUserRequest(
        firstName: firstNameValue!,
        lastName: lastNameValue!,
        email: emailAddressValue!,
        phoneNumber: phoneNumberValue!,
        password: pinValue!,
        bvn: bvnValue!,
        nin: ninValue!);

    await _authService.createAccount(createUser);

    _navigationService.navigateToOtpView(timerStarted: true);
  }

  void buttonPress() {
    setError(null);
    logger.i("Create account button pressed");
    if (isBusy) {
      logger.v("view busy - return");
      return;
    }

    validateForm();
    if (hasAnyValidationMessage) {
      logger.v("form invalid - return");
      return;
    }
    runBusyFuture(_createAccount());
  }
}
