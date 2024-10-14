import 'package:stacked/stacked.dart';

class OnboardingViewModel extends BaseViewModel {
  int _pageIndex = 0;
  int get pageIndex => _pageIndex;

  void changePage(int newPageIndex) {
    _pageIndex = newPageIndex;
    rebuildUi();
  }
}
