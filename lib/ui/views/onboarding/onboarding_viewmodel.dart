import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:thrivia_app/app/app.locator.dart';
import 'package:thrivia_app/app/app.router.dart';
import 'package:thrivia_app/main.dart';

class OnboardingViewModel extends BaseViewModel {
  int _pageIndex = 0;
  int get pageIndex => _pageIndex;

  final _navigatorService = locator<NavigationService>();

  void changePage(int newPageIndex) {
    _pageIndex = newPageIndex;
    rebuildUi();
  }

  void nextPage() {
    if (_pageIndex == 2) {
      _navigatorService.navigateToCreateAccountView();
    }
    _pageIndex = _pageIndex + 1;
    rebuildUi();
  }
}
