import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:thrivia_app/app/app.locator.dart';
import 'package:thrivia_app/app/app.router.dart';
import 'package:thrivia_app/common/exceptions.dart';
import 'package:thrivia_app/feat_auth/data_models/data_models.barrel.dart';
import 'package:thrivia_app/feat_auth/repository/auth_repository_service.dart';
import 'package:thrivia_app/feat_auth/services/auth_service.dart';
import 'package:thrivia_app/feat_auth/ui/create_account/create_account_view.dart';
import 'package:thrivia_app/feat_auth/ui/create_account/create_account_view.form.dart';
import 'package:thrivia_app/feat_auth/ui/create_account/create_account_viewmodel.dart';

import '../helpers/test_helpers.dart';
import '../helpers/test_helpers.mocks.dart';

void main() {
  group('CreateAccountViewModel Tests -', () {
    late NavigationService mockNavigationService;
    late MockAuthService mockAuthService;
    late CreateAccountViewModel model;
    late CreateAccountView view;

    setUp(() {
      registerServices();
      mockNavigationService = locator<NavigationService>();

      mockAuthService = getAndRegisterAuthService();

      // mockAuthService = AuthService();
      // locator.unregister<AuthService>();
      // locator.registerSingleton<AuthService>(mockAuthService);

      model = CreateAccountViewModel();
      view = CreateAccountView();
      view.syncFormWithViewModel(model);
    });

    tearDown(() => locator.reset());

    group('Create Account - invalid info', () {
      test('should show validation message when form is invalid', () {
        model.buttonPress();
        expect(model.hasAnyValidationMessage, true);
      });

      group('Invalid info types', () {
        setUp(() {
          model.firstNameValue = '';
          model.lastNameValue = 'Doe Doe';
          model.emailAddressValue = 'john.doe@exam@ple.com';
          model.phoneNumberValue = '08088989889';
          model.pinValue = '123456';
          model.pinConfirmValue = '123456';

          model.bvnValue = '12345678901';
          model.ninValue = '12345678901';
        });

        test('should show validation message when form is invalid', () {
          model.buttonPress();
          expect(model.firstNameValidationMessage, "Please enter a valid name");
          expect(model.lastNameValidationMessage, null);
          expect(model.emailAddressValidationMessage, "Invalid email format");
        });
      });
    });

    group('Create Account - valid info', () {
      setUp(() {
        model.firstNameValue = 'John';
        model.lastNameValue = 'Doe';
        model.emailAddressValue = 'john.doe@example.com';
        model.phoneNumberValue = '08088989889';
        model.pinValue = '123456';
        model.pinConfirmValue = '123456';

        model.bvnValue = '12345678901';
        model.ninValue = '12345678901';
      });

      test('should call createAccount when form is valid', () async {
        model.buttonPress();
        // expect(
        //   mockAuthService.authState,
        //   AuthState.pendingVerifyOTP,
        // );

        // await widgetTester.pumpWidget(view);

        // arguments: OtpViewArguments(timerStarted: true, ),

        await Future.delayed(Duration(seconds: 1));
        verify(mockNavigationService.navigateToOtpView(timerStarted: true));
      });

      // test(
      //   'should navigate to OTP view when account creation is successful',
      //   () async {
      //     model.buttonPress();

      //   },
      // );
    });

    group('Create Account - go to Login', () {
      // Add tests for navigation to login if needed
    });

    group('Create Account backend exception', () {
      setUp(() {
        model.firstNameValue = 'John';
        model.lastNameValue = 'Doe';
        model.emailAddressValue = 'john.doe@example.com';
        model.phoneNumberValue = '08088989889';
        model.pinValue = '123456';
        model.pinConfirmValue = '123456';

        model.bvnValue = '12345678901';
        model.ninValue = '12345678901';
      });

      test('do not navigate when backend exception thrown', () async {
        CreateUserRequest(
          firstName: model.firstNameValue!,
          lastName: model.lastNameValue!,
          email: model.emailAddressValue!,
          phoneNumber: model.phoneNumberValue!,
          password: model.pinValue!,
          bvn: model.bvnValue!,
          nin: model.ninValue!,
        );
        when(
          mockAuthService.createAccount(any),
        ).thenThrow(BackendException(message: "User already registered"));
        model.buttonPress();

        await Future.delayed(Duration(seconds: 1));
        verifyNever(mockNavigationService.navigateToOtpView(
          timerStarted: true,
        ));
      });
    });
  });
}
