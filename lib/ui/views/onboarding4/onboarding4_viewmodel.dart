import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:thrivia_app/app/app.locator.dart';
import 'package:thrivia_app/app/app.router.dart';
import 'package:thrivia_app/services/user_manager_service.dart';

class Onboarding4ViewModel extends BaseViewModel {
  final _userService = locator<UserManagerService>();
  final _navigationService = locator<NavigationService>();

  goToCreateAccount(UserType userType) {
    _userService.userType = userType;
    _navigationService.navigateToCreateAccountView();
  }
}
