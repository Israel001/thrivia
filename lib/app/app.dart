import 'package:thrivia_app/feat_auth/ui/otp/otp_view.dart';
import 'package:thrivia_app/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:thrivia_app/ui/dialogs/info_alert/info_alert_dialog.dart';

import 'package:thrivia_app/feat_startup/ui/splash/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:thrivia_app/feat_onboarding/ui/onboarding/onboarding_view.dart';
import 'package:thrivia_app/feat_home/ui/role_select/onboarding4_view.dart';
import 'package:thrivia_app/feat_auth/ui/create_account/create_account_view.dart';
import 'package:thrivia_app/feat_auth/ui/login/login_view.dart';

import 'package:thrivia_app/feat_home/ui/home/home_view.dart';

import 'package:thrivia_app/feat_auth/services/auth_service.dart';
import 'package:thrivia_app/feat_auth/ui/forgot_password/forgot_password_view.dart';
import 'package:thrivia_app/feat_auth/repository/auth_repository_service.dart';
import 'package:thrivia_app/services/dio_service.dart';

// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: OnboardingView),
    MaterialRoute(page: Onboarding4View),
    MaterialRoute(page: CreateAccountView),
    MaterialRoute(page: LoginView),

    MaterialRoute(page: ForgotPasswordView),
    MaterialRoute(page: OtpView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: AuthService),
    LazySingleton(classType: AuthRepository),
    LazySingleton(classType: DioService),
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
