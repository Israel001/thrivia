import 'package:flutter_test/flutter_test.dart';
import 'package:thrivia_app/app/app.locator.dart';
import 'package:mockito/mockito.dart';
import 'package:thrivia_app/feat_auth/services/auth_service.dart';
import 'package:thrivia_app/feat_auth/ui/forgot_password/forgot_password_viewmodel.dart';

import 'package:thrivia_app/feat_auth/repository/auth_repository_service.dart';

import '../helpers/test_helpers.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  group('ForgotPasswordViewModel Tests -', () {
    late AuthRepository mockAuthRepository;
    late final ForgotPasswordViewModel viewModel;
    setUp(() {
      registerServices();
      viewModel = ForgotPasswordViewModel();
      locator.removeRegistrationIfExists<AuthRepository>();
      locator.registerSingleton<AuthRepository>(MockAuthRepository());
      mockAuthRepository = locator<AuthRepository>();
    });
    tearDown(() => locator.reset());

    test('should call resetPassword on AuthRepository', () async {
      String any = "any";
      when(mockAuthRepository.resetPassword(any, any))
          .thenAnswer((_) async => true);

      viewModel.resetPassword();

      verify(mockAuthRepository.resetPassword(any, any)).called(1);
    });

    //   test('should set isBusy to true while resetting password', () async {
    //     final mockAuthRepository = MockAuthRepository();
    //     final authService = AuthService();
    //     authService.authRepository = mockAuthRepository;
    //     final viewModel = ForgotPasswordViewModel(authService: authService);

    //     when(mockAuthRepository.resetPassword(any, any))
    //         .thenAnswer((_) async => true);

    //     final future = viewModel.resetPassword('test@example.com');

    //     expect(viewModel.isBusy, true);

    //     await future;

    //     expect(viewModel.isBusy, false);
    //   });

    //   test('should set hasError to true if resetPassword fails', () async {
    //     final mockAuthRepository = MockAuthRepository();
    //     final authService = AuthService();
    //     authService.authRepository = mockAuthRepository;
    //     final viewModel = ForgotPasswordViewModel(authService: authService);

    //     when(mockAuthRepository.resetPassword(any, any))
    //         .thenThrow(Exception('Failed'));

    //     await viewModel.resetPassword('test@example.com');

    //     expect(viewModel.hasError, true);
    //   });

    //   test('should call initiateResetPassword on AuthRepository', () async {
    //     final mockAuthRepository = MockAuthRepository();
    //     final authService = AuthService();
    //     authService.authRepository = mockAuthRepository;
    //     final viewModel = ForgotPasswordViewModel(authService: authService);

    //     when(mockAuthRepository.intiateResetPassword(any))
    //         .thenAnswer((_) async => VerifyOTPBody());

    //     await viewModel.initiateResetPassword('test@example.com');

    //     verify(mockAuthRepository.intiateResetPassword('test@example.com'))
    //         .called(1);
    //   });

    //   test('should set isBusy to true while initiating password reset', () async {
    //     final mockAuthRepository = MockAuthRepository();
    //     final authService = AuthService();
    //     authService.authRepository = mockAuthRepository;
    //     final viewModel = ForgotPasswordViewModel(authService: authService);

    //     when(mockAuthRepository.intiateResetPassword(any))
    //         .thenAnswer((_) async => VerifyOTPBody());

    //     final future = viewModel.initiateResetPassword('test@example.com');

    //     expect(viewModel.isBusy, true);

    //     await future;

    //     expect(viewModel.isBusy, false);
    //   });

    //   test('should set hasError to true if initiateResetPassword fails',
    //       () async {
    //     final mockAuthRepository = MockAuthRepository();
    //     final authService = AuthService();
    //     authService.authRepository = mockAuthRepository;
    //     final viewModel = ForgotPasswordViewModel(authService: authService);

    //     when(mockAuthRepository.intiateResetPassword(any))
    //         .thenThrow(Exception('Failed'));

    //     await viewModel.initiateResetPassword('test@example.com');

    //     expect(viewModel.hasError, true);
    //   });
  });
}
