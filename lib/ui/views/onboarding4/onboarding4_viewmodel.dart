import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:thrivia_app/app/app.locator.dart';
import 'package:thrivia_app/app/app.router.dart';

class Onboarding4ViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  goToCreateAccount() {
    _navigationService.navigateToCreateAccountView();
  }
}
