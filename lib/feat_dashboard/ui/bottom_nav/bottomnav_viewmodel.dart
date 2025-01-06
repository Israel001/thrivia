import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:thrivia_app/app/app.locator.dart';
import 'package:thrivia_app/app/app.logger.dart';
import 'package:thrivia_app/feat_dashboard/ui/bottom_nav/views/community/community_view.dart';
import 'package:thrivia_app/feat_dashboard/ui/bottom_nav/views/finance/finance_view.dart';
import 'package:thrivia_app/feat_dashboard/ui/bottom_nav/views/home/home_view.dart';
import 'package:thrivia_app/feat_dashboard/ui/bottom_nav/views/profile/profile_view.dart';

final GlobalKey<ScaffoldState> bottomNavScaffoldKey =
    GlobalKey<ScaffoldState>();

class BottomNavViewModel extends IndexTrackingViewModel {
  // final log = getLogger('BottomNavExampleViewModel');

  final _navigationService = locator<NavigationService>();
  final logger = getLogger("BottomNavViewModel");
  // void handleNavigation(int index) {
  //   logger.i('handleNavigation: $index');
  //   setIndex(index);
  //   switch (index) {
  //     case 0:
  //       _navigationService.replaceWithTransition(
  //         const HomeView(),
  //         transitionStyle:
  //             reverse ? Transition.rightToLeft : Transition.leftToRight,
  //         // id: 0,
  //       );
  //       break;
  //     case 1:
  //       _navigationService.replaceWithTransition(
  //         const FinanceView(),
  //         transitionStyle:
  //             reverse ? Transition.rightToLeft : Transition.leftToRight,
  //         // id: 1,
  //       );
  //       break;
  //     case 2:
  //       _navigationService.replaceWithTransition(
  //         const CommunityView(),
  //         transitionStyle:
  //             reverse ? Transition.rightToLeft : Transition.leftToRight,
  //         // id: 2,
  //       );
  //       break;
  //     case 3:
  //       _navigationService.replaceWithTransition(
  //         const ProfileView(),
  //         transitionStyle:
  //             reverse ? Transition.rightToLeft : Transition.leftToRight,
  //         // id: 3,
  //       );
  //       break;
  //     default:
  //   }
  // }

  Widget getViewForIndex(int index) {
    switch (index) {
      case 0:
        return const HomeView();

        // id: 0,

        break;
      case 1:
        return const FinanceView();

        // id: 1,

        break;
      case 2:
        return const CommunityView();

        // id: 2,

        break;
      case 3:
        return const ProfileView();

        // id: 3,

        break;
      default:
        return SizedBox();
    }
  }

  void joinCooperative() {}
}
