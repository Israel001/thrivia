import 'package:stacked/stacked.dart';
import 'package:thrivia_app/app/app.locator.dart';
import 'package:thrivia_app/app/app.logger.dart';
import 'package:thrivia_app/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:thrivia_app/main.dart';
import 'package:thrivia_app/services/storage_service.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _storageService = locator<StorageService>();
  final logger = getLogger("StartupViewModel");

  Future runStartupLogic() async {
    await Future.delayed(const Duration(seconds: 2));

    // This is where you can make decisions on where your app should navigate when
    // you have custom startup logic
    if (Overides.overrideInitialLocation != null) {
      logger.i(
          "Using init location override. Going to ${Overides.overrideInitialLocation}");
      _navigationService.replaceWith(Overides.overrideInitialLocation);
      return;
    }

    final isOnboarded =
        (await _storageService.getValue(StorageKeys.onboarded)) == "true";

    if (!isOnboarded) {
      logger.i("User is not yet onboarded. Going to onboarding view");
      _navigationService.replaceWithOnboardingView();
      return;
    }

    logger.i("User is onboarded already. Going to Login view");
    _navigationService.replaceWithLoginView();
  }
}
