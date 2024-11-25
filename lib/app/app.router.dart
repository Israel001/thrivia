// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i15;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i16;
import 'package:thrivia_app/feat_auth/ui/create_account/create_account_view.dart'
    as _i6;
import 'package:thrivia_app/feat_auth/ui/forgot_password/forgot_password_view.dart'
    as _i8;
import 'package:thrivia_app/feat_auth/ui/login/login_view.dart' as _i7;
import 'package:thrivia_app/feat_auth/ui/otp/otp_view.dart' as _i9;
import 'package:thrivia_app/feat_cooperative/ui/join_cooperative/join_cooperative_view.dart'
    as _i14;
import 'package:thrivia_app/feat_dashboard/ui/bottom_nav/bottomnav_view.dart'
    as _i2;
import 'package:thrivia_app/feat_dashboard/ui/bottom_nav/views/community/community_view.dart'
    as _i12;
import 'package:thrivia_app/feat_dashboard/ui/bottom_nav/views/finance/finance_view.dart'
    as _i11;
import 'package:thrivia_app/feat_dashboard/ui/bottom_nav/views/home/home_view.dart'
    as _i10;
import 'package:thrivia_app/feat_dashboard/ui/bottom_nav/views/profile/profile_view.dart'
    as _i13;
import 'package:thrivia_app/feat_dashboard/ui/role_select/onboarding4_view.dart'
    as _i5;
import 'package:thrivia_app/feat_onboarding/ui/onboarding/onboarding_view.dart'
    as _i4;
import 'package:thrivia_app/feat_startup/ui/splash/startup_view.dart' as _i3;

class Routes {
  static const bottomNavView = '/bottom-nav-view';

  static const startupView = '/startup-view';

  static const onboardingView = '/onboarding-view';

  static const onboarding4View = '/onboarding4-view';

  static const createAccountView = '/create-account-view';

  static const loginView = '/login-view';

  static const forgotPasswordView = '/forgot-password-view';

  static const otpView = '/otp-view';

  static const homeView = '/home-view';

  static const financeView = '/finance-view';

  static const communityView = '/community-view';

  static const profileView = '/profile-view';

  static const joinCooperativeView = '/join-cooperative-view';

  static const all = <String>{
    bottomNavView,
    startupView,
    onboardingView,
    onboarding4View,
    createAccountView,
    loginView,
    forgotPasswordView,
    otpView,
    homeView,
    financeView,
    communityView,
    profileView,
    joinCooperativeView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.bottomNavView,
      page: _i2.BottomNavView,
    ),
    _i1.RouteDef(
      Routes.startupView,
      page: _i3.StartupView,
    ),
    _i1.RouteDef(
      Routes.onboardingView,
      page: _i4.OnboardingView,
    ),
    _i1.RouteDef(
      Routes.onboarding4View,
      page: _i5.Onboarding4View,
    ),
    _i1.RouteDef(
      Routes.createAccountView,
      page: _i6.CreateAccountView,
    ),
    _i1.RouteDef(
      Routes.loginView,
      page: _i7.LoginView,
    ),
    _i1.RouteDef(
      Routes.forgotPasswordView,
      page: _i8.ForgotPasswordView,
    ),
    _i1.RouteDef(
      Routes.otpView,
      page: _i9.OtpView,
    ),
    _i1.RouteDef(
      Routes.homeView,
      page: _i10.HomeView,
    ),
    _i1.RouteDef(
      Routes.financeView,
      page: _i11.FinanceView,
    ),
    _i1.RouteDef(
      Routes.communityView,
      page: _i12.CommunityView,
    ),
    _i1.RouteDef(
      Routes.profileView,
      page: _i13.ProfileView,
    ),
    _i1.RouteDef(
      Routes.joinCooperativeView,
      page: _i14.JoinCooperativeView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.BottomNavView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.BottomNavView(),
        settings: data,
      );
    },
    _i3.StartupView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.StartupView(),
        settings: data,
      );
    },
    _i4.OnboardingView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.OnboardingView(),
        settings: data,
      );
    },
    _i5.Onboarding4View: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.Onboarding4View(),
        settings: data,
      );
    },
    _i6.CreateAccountView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i6.CreateAccountView(),
        settings: data,
      );
    },
    _i7.LoginView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i7.LoginView(),
        settings: data,
      );
    },
    _i8.ForgotPasswordView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i8.ForgotPasswordView(),
        settings: data,
      );
    },
    _i9.OtpView: (data) {
      final args = data.getArgs<OtpViewArguments>(
        orElse: () => const OtpViewArguments(),
      );
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i9.OtpView(key: args.key, timerStarted: args.timerStarted),
        settings: data,
      );
    },
    _i10.HomeView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i10.HomeView(),
        settings: data,
      );
    },
    _i11.FinanceView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i11.FinanceView(),
        settings: data,
      );
    },
    _i12.CommunityView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i12.CommunityView(),
        settings: data,
      );
    },
    _i13.ProfileView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i13.ProfileView(),
        settings: data,
      );
    },
    _i14.JoinCooperativeView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i14.JoinCooperativeView(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class OtpViewArguments {
  const OtpViewArguments({
    this.key,
    this.timerStarted = false,
  });

  final _i15.Key? key;

  final bool timerStarted;

  @override
  String toString() {
    return '{"key": "$key", "timerStarted": "$timerStarted"}';
  }

  @override
  bool operator ==(covariant OtpViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.timerStarted == timerStarted;
  }

  @override
  int get hashCode {
    return key.hashCode ^ timerStarted.hashCode;
  }
}

extension NavigatorStateExtension on _i16.NavigationService {
  Future<dynamic> navigateToBottomNavView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.bottomNavView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToOnboardingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.onboardingView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToOnboarding4View([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.onboarding4View,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCreateAccountView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.createAccountView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.loginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToForgotPasswordView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.forgotPasswordView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToOtpView({
    _i15.Key? key,
    bool timerStarted = false,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.otpView,
        arguments: OtpViewArguments(key: key, timerStarted: timerStarted),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToFinanceView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.financeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCommunityView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.communityView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToProfileView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.profileView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToJoinCooperativeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.joinCooperativeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithBottomNavView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.bottomNavView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithOnboardingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.onboardingView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithOnboarding4View([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.onboarding4View,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCreateAccountView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.createAccountView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.loginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithForgotPasswordView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.forgotPasswordView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithOtpView({
    _i15.Key? key,
    bool timerStarted = false,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.otpView,
        arguments: OtpViewArguments(key: key, timerStarted: timerStarted),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithFinanceView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.financeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCommunityView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.communityView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithProfileView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.profileView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithJoinCooperativeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.joinCooperativeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
