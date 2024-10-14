import 'package:thrivia_app/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:thrivia_app/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:thrivia_app/ui/views/home/home_view.dart';
import 'package:thrivia_app/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:thrivia_app/ui/views/onboarding/onboarding_view.dart';
import 'package:thrivia_app/ui/views/onboarding4/onboarding4_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: OnboardingView),
    MaterialRoute(page: Onboarding4View),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    // @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}