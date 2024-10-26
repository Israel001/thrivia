import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:thrivia_app/app/app.locator.dart';
import 'package:thrivia_app/ui/views/home/home_view.dart';

class BottomNavViewModel extends IndexTrackingViewModel {
  // final log = getLogger('BottomNavExampleViewModel');
  final _navigationService = locator<NavigationService>();

  void handleNavigation(int index) {
    // log.i('handleNavigation: $index');
    setIndex(index);
    switch (index) {
      case 0:
        _navigationService.replaceWithTransition(
          const HomeView(),
          transitionStyle:
              reverse ? Transition.rightToLeft : Transition.leftToRight,
          id: 1,
        );
        break;
      case 1:
        _navigationService.replaceWithTransition(
          const HomeView(),
          transitionStyle:
              reverse ? Transition.rightToLeft : Transition.leftToRight,
          id: 1,
        );
        break;
      case 2:
        _navigationService.replaceWithTransition(
          const HomeView(),
          transitionStyle:
              reverse ? Transition.rightToLeft : Transition.leftToRight,
          id: 1,
        );
        break;
      case 3:
        _navigationService.replaceWithTransition(
          const HomeView(),
          transitionStyle:
              reverse ? Transition.rightToLeft : Transition.leftToRight,
          id: 1,
        );
        break;
      default:
    }
  }
}
