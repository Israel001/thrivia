import 'package:thrivia_app/feat_auth/ui/otp/otp_view.dart';
import 'package:thrivia_app/main.dart';
import 'package:thrivia_app/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:thrivia_app/ui/dialogs/info_alert/info_alert_dialog.dart';

import 'package:thrivia_app/feat_startup/ui/splash/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:thrivia_app/feat_onboarding/ui/onboarding/onboarding_view.dart';
import 'package:thrivia_app/feat_dashboard/ui/role_select/onboarding4_view.dart';
import 'package:thrivia_app/feat_auth/ui/create_account/create_account_view.dart';
import 'package:thrivia_app/feat_auth/ui/login/login_view.dart';

import 'package:thrivia_app/feat_dashboard/ui/bottom_nav/bottomnav_view.dart';

import 'package:thrivia_app/feat_auth/services/auth_service.dart';
import 'package:thrivia_app/feat_auth/ui/forgot_password/forgot_password_view.dart';
import 'package:thrivia_app/feat_auth/repository/auth_repository_service.dart';
import 'package:thrivia_app/services/dio_service.dart';

import 'package:thrivia_app/services/storage_service.dart';
import 'package:thrivia_app/feat_dashboard/ui/bottom_nav/views/community/community_view.dart';
import 'package:thrivia_app/feat_dashboard/ui/bottom_nav/views/finance/finance_view.dart';
import 'package:thrivia_app/feat_dashboard/ui/bottom_nav/views/home/home_view.dart';
import 'package:thrivia_app/feat_dashboard/ui/bottom_nav/views/profile/profile_view.dart';

// @stacked-import

@StackedApp(routes: [
  MaterialRoute(page: BottomNavView),
  MaterialRoute(page: StartupView),
  MaterialRoute(page: OnboardingView),
  MaterialRoute(page: Onboarding4View),
  MaterialRoute(page: CreateAccountView),
  MaterialRoute(page: LoginView),

  MaterialRoute(page: ForgotPasswordView),
  MaterialRoute(page: OtpView),
  MaterialRoute(page: HomeView),
  MaterialRoute(page: FinanceView),
  MaterialRoute(page: CommunityView),
  MaterialRoute(page: ProfileView),
  // MaterialRoute(page: ForgotPasswordView),
// @stacked-route
], dependencies: [
  LazySingleton(classType: BottomSheetService),
  LazySingleton(classType: DialogService),
  LazySingleton(asType: NavigationService, classType: NavigationService),
  LazySingleton(classType: AuthService),
  LazySingleton(
      asType: AuthRepository,
      classType: Overides.mockAuthRepository
          ? MockedAuthRepository
          : BackendAuthRepository),
  // LazySingleton(asType: AuthRepository, classType: BackendAuthRepository),
  LazySingleton(classType: DioService),
  LazySingleton(classType: StorageService),
// @stacked-service
], bottomsheets: [
  StackedBottomsheet(classType: NoticeSheet),
  // @stacked-bottom-sheet
], dialogs: [
  StackedDialog(classType: InfoAlertDialog),
  // @stacked-dialog
], logger: StackedLogger())
class App {}
