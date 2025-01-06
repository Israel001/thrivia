import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:thrivia_app/app/app.locator.dart';
import 'package:thrivia_app/app/app.router.dart';
import 'package:thrivia_app/feat_auth/data_models/data_models.barrel.dart';
import 'package:thrivia_app/feat_auth/services/auth_service.dart';
import 'package:thrivia_app/feat_auth/ui/login/login_view.dart';
import 'package:thrivia_app/feat_auth/ui/login/login_view.form.dart';
import 'package:thrivia_app/feat_auth/ui/login/login_viewmodel.dart';

import '../helpers/test_helpers.dart';
import '../helpers/test_helpers.mocks.dart';

void main() {
  group('LoginViewModel Tests -', () {
    late LoginViewModel viewModel;
    late MockAuthService mockAuthService;
    late MockNavigationService mockNavigationService;

    setUp(() {
      registerServices();
      viewModel = LoginViewModel();
      LoginView().syncFormWithViewModel(viewModel);
      mockAuthService = locator<AuthService>() as MockAuthService;
      mockNavigationService =
          locator<NavigationService>() as MockNavigationService;
    });
    tearDown(() => locator.reset());

    test('should validate form and login user on button press', () async {
      when(
        mockAuthService.loginUser(
          emailOrPhone: anyNamed('emailOrPhone'),
          password: anyNamed("password"),
        ),
      ).thenAnswer((_) async {});

      viewModel.emailPhoneNumberValue = 'test@example.com';
      viewModel.passwordValue = '123456';

      viewModel.buttonPress();

      await wait();
      verify(mockAuthService.loginUser(
        emailOrPhone: anyNamed("emailOrPhone"),
        password: anyNamed("password"),
      ));
    });

    test('should navigate to OTP screen if auth state is pendingVerifyOTP',
        () async {
      when(mockAuthService.loginUser(
              emailOrPhone: anyNamed('emailOrPhone'),
              password: anyNamed('password')))
          .thenAnswer((_) async {
        when(mockAuthService.goToOTPScreen).thenReturn(true);
      });

      viewModel.emailPhoneNumberValue = 'test@example.com';
      viewModel.passwordValue = '123456';

      viewModel.buttonPress();

      await wait();
      verify(mockNavigationService.navigateToOtpView(timerStarted: true))
          .called(1);
    });

    test('should navigate to bottom nav if auth state is loggedIn', () async {
      when(mockAuthService.loginUser(
              emailOrPhone: anyNamed('emailOrPhone'),
              password: anyNamed('password')))
          .thenAnswer((_) async {
        when(mockAuthService.authState).thenReturn(AuthState.loggedIn);
      });

      viewModel.emailPhoneNumberValue = 'test@example.com';
      viewModel.passwordValue = '123456';

      viewModel.buttonPress();
      await wait();

      verify(mockNavigationService.replaceWith(Routes.bottomNavView)).called(1);
    });

    test('should navigate to forgot password view on forgotPassword call', () {
      viewModel.forgotPassword();

      verify(mockNavigationService.navigateTo(Routes.forgotPasswordView))
          .called(1);
    });

    test('should navigate to bottom nav view on shortCut call', () {
      viewModel.shortCut();

      verify(mockNavigationService.navigateToBottomNavView()).called(1);
    });
  });
}

wait() async {
  await Future.delayed(Duration(seconds: 2));
}
