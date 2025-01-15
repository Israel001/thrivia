import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:thrivia_app/app/app.locator.dart';
import 'package:thrivia_app/common/exceptions.dart';
import 'package:thrivia_app/feat_auth/data_models/data_models.barrel.dart';
import 'package:thrivia_app/feat_auth/data_models/data_models.dart';
import 'package:thrivia_app/feat_auth/repository/auth_repository_service.dart';
import 'package:thrivia_app/feat_auth/services/auth_service.dart';
import 'package:thrivia_app/feat_users/data_models/user.dart';

import '../helpers/test_helpers.dart';
import '../helpers/test_helpers.mocks.dart';

void main() {
  group('AuthService Tests -', () {
    late AuthService authService;
    late MockAuthRepository mockAuthRepository;

    setUp(() {
      registerServices();
      authService = AuthService();

      mockAuthRepository = locator<AuthRepository>() as MockAuthRepository;
    });

    tearDown(() => locator.reset());

    group('Create Account', () {
      test('should ask to verify otp on createAccountResponse', () async {
        when(mockAuthRepository.createAccount(any))
            .thenAnswer((_) async => CreateAccountResponse(
                  pinId: 'dummy-pinId',
                  uuid: "dummy-uiid",
                ));

        await authService.createAccount(
          CreateUserRequest(
            firstName: "firstName",
            lastName: "lastName",
            email: "email",
            phoneNumber: "phoneNumber",
            password: "password",
            bvn: "bvn",
            nin: "nin",
          ),
        );

        expect(authService.authState, AuthState.pendingVerifyOTP);
      });

      test('should handle error on create Account fail', () async {
        when(mockAuthRepository.createAccount(any)).thenThrow(BackendException(
            message: "Account already exists",
            devDetails: "response",
            prettyDetails: "Sorry, this account exists already"));

        expect(
          () async => await authService.createAccount(
            CreateUserRequest(
              firstName: "firstName",
              lastName: "lastName",
              email: "email",
              phoneNumber: "phoneNumber",
              password: "password",
              bvn: "bvn",
              nin: "nin",
            ),
          ),
          throwsA(isA<BackendException>()),
        );

        expect(authService.authState, AuthState.newUser);
      });
    });

    group('Login User', () {
      test('should login user and update auth state to loggedIn', () async {
        final loginResponseJson = {
          'user': {
            'uuid': 'dummy-uuid',
            'deletedAt': null,
            'firstName': 'John',
            'lastName': 'Doe',
            'phoneNumber': '1234567890',
            'email': 'test@example.com',
            'membershipNo': '12345',
            'dateOfBirth': DateTime(1990, 1, 1).toString(),
            'address': '123 Main St',
            'phoneVerified': true,
            'lastLoggedIn': DateTime.now().toString(),
            'incomeSource': 'Job',
            'employmentDetails': 'Software Engineer',
            'additionalDetails': 'None',
            'bvn': '12345678901',
            'nin': '12345678901',
            'accountName': 'John Doe',
            'accountReference': '1234567890',
            'bankAccounts': '1234567890',
            'providerResponse': 'Success',
            'activeCooperative': 'Coop',
          },
          'accessToken': 'accessToken',
          'refreshToken': 'refreshToken',
          'expiresIn': 3600,
        };
        when(mockAuthRepository.loginUser(any))
            .thenAnswer((_) async => loginResponseJson);

        await authService.loginUser(
          emailOrPhone: 'test@example.com',
          password: '123456',
        );

        expect(authService.authState, AuthState.loggedIn);
        expect(authService.user?.email, 'test@example.com');
      });

      test('should ask to verify if user not verified', () async {
        final createAccountResponseJson = {
          'pinId': 'dummy-pinId',
          'uuid': 'dummy-uuid',
        };
        when(mockAuthRepository.loginUser(any))
            .thenAnswer((_) async => createAccountResponseJson);

        await authService.loginUser(
          emailOrPhone: 'test@example.com',
          password: '123456',
        );

        expect(authService.authState, AuthState.pendingVerifyOTP);
        expect(authService.user?.email, isNull);
      });
    });

    group('Verify OTP', () {
      test('should not change auth State if no otp is pending', () async {
        final stateBefore = authService.authState;

        await authService.verifyOTP('123456');

        expect(authService.authState, stateBefore);
      });
    });

    group('Reset Password', () {
      test('should initiate reset password, verify OTP and reset Password',
          () async {
        when(mockAuthRepository.initiateResetPassword(any))
            .thenAnswer((_) async => VerifyOTPBody(
                  otp: null,
                  otpActionType: OtpActionType.RESET_PASSWORD,
                  pinId: 'pinId',
                  userUuid: 'userUuid',
                ));

        await authService.initiateResetPassword('test@example.com');

        expect(authService.authState, AuthState.pendingPasswordResetOTP);

        when(mockAuthRepository.verifyOTP(any))
            .thenAnswer((_) async => 'passwordChangeToken');

        await authService.verifyOTP('123456');

        expect(authService.authState, AuthState.validPasswordResetOTP);

        when(mockAuthRepository.resetPassword(
                accessToken: anyNamed('accessToken'),
                newPassword: anyNamed('newPassword')))
            .thenAnswer((_) async => null);

        await authService.resetPassword('newPassword');

        expect(authService.authState, AuthState.loggedOut);
      });

      test('should initiate, handle error on verify otp', () async {
        when(mockAuthRepository.initiateResetPassword(any))
            .thenAnswer((_) async => VerifyOTPBody(
                  otp: null,
                  otpActionType: OtpActionType.RESET_PASSWORD,
                  pinId: 'pinId',
                  userUuid: 'userUuid',
                ));

        await authService.initiateResetPassword('test@example.com');

        expect(authService.authState, AuthState.pendingPasswordResetOTP);

        when(mockAuthRepository.verifyOTP(any))
            .thenThrow(BackendException(message: "message"));

        expect(() async => await authService.verifyOTP('123456'),
            throwsA(isA<BackendException>()));

        expect(authService.authState, AuthState.pendingPasswordResetOTP);
      });

      test('should initiate, verify, otp, handle error on reset password',
          () async {
        when(mockAuthRepository.initiateResetPassword(any))
            .thenAnswer((_) async => VerifyOTPBody(
                  otp: null,
                  otpActionType: OtpActionType.RESET_PASSWORD,
                  pinId: 'pinId',
                  userUuid: 'userUuid',
                ));

        await authService.initiateResetPassword('test@example.com');

        expect(authService.authState, AuthState.pendingPasswordResetOTP);

        when(mockAuthRepository.verifyOTP(any))
            .thenAnswer((_) async => 'passwordChangeToken');

        await authService.verifyOTP('123456');

        expect(authService.authState, AuthState.validPasswordResetOTP);

        when(mockAuthRepository.resetPassword(accessToken:  any,newPassword:  any)).thenThrow(
            BackendException(
                message: "Invalid token",
                devDetails: "response",
                prettyDetails: "The token provided is invalid"));

        expect(
          () async => await authService.resetPassword('newPassword'),
          throwsA(isA<BackendException>()),
        );

        expect(
          authService.authState,
          AuthState.validPasswordResetOTP,
        );
      });
    });

    test('should initiate reset password and update auth state', () async {
      when(mockAuthRepository.initiateResetPassword(any))
          .thenAnswer((_) async => VerifyOTPBody(
                otp: null,
                otpActionType: OtpActionType.RESET_PASSWORD,
                pinId: 'pinId',
                userUuid: 'userUuid',
              ));
      final otp = "123456";
      final verifyRequest = VerifyOTPBody(
          otp: otp,
          otpActionType: OtpActionType.RESET_PASSWORD,
          pinId: 'pinId',
          userUuid: "userUuid");

      when(mockAuthRepository.verifyOTP(verifyRequest))
          .thenAnswer((_) async => null);

      when(mockAuthRepository.resetPassword( accessToken:  anyNamed("accessToken"),newPassword:  anyNamed("newPassword")))
          .thenAnswer((_) async => null);

      await authService.initiateResetPassword('test@example.com');

      expect(authService.authState, AuthState.pendingPasswordResetOTP);
    });
    group('Request OTP', () {
      test('should request OTP and update auth state to pendingVerifyOTP',
          () async {
        when(mockAuthRepository.createAccount(any))
            .thenAnswer((_) async => CreateAccountResponse(
                  pinId: 'dummy-pinId',
                  uuid: "dummy-uiid",
                ));
        await authService.createAccount(CreateUserRequest(
          firstName: "firstName",
          lastName: "lastName",
          email: "email",
          phoneNumber: "phoneNumber",
          password: "password",
          bvn: "bvn",
          nin: "nin",
        ));

        when(mockAuthRepository.requestOTP(any))
            .thenAnswer((_) async => 'otpId');

        await authService.requestOTP();

        expect(authService.authState, AuthState.pendingVerifyOTP);
      });

      test(
          'should request OTP and update auth state to pendingPasswordResetOTP',
          () async {
        when(mockAuthRepository.initiateResetPassword(any))
            .thenAnswer((_) async => VerifyOTPBody(
                  otp: null,
                  otpActionType: OtpActionType.RESET_PASSWORD,
                  pinId: 'pinId',
                  userUuid: 'userUuid',
                ));
        await authService.initiateResetPassword('test@example.com');

        when(mockAuthRepository.requestOTP(any))
            .thenAnswer((_) async => 'otpId');

        await authService.requestOTP();

        expect(authService.authState, AuthState.pendingPasswordResetOTP);
      });

      test('should handle error on request OTP fail', () async {
        when(mockAuthRepository.createAccount(any))
            .thenAnswer((_) async => CreateAccountResponse(
                  pinId: 'dummy-pinId',
                  uuid: "dummy-uiid",
                ));

        await authService.createAccount(CreateUserRequest(
          firstName: "firstName",
          lastName: "lastName",
          email: "email",
          phoneNumber: "phoneNumber",
          password: "password",
          bvn: "bvn",
          nin: "nin",
        ));

        when(mockAuthRepository.requestOTP(any)).thenThrow(BackendException(
            message: "OTP request failed",
            devDetails: "response",
            prettyDetails: "Failed to request OTP"));

        expect(
          () async => await authService.requestOTP(),
          throwsA(isA<BackendException>()),
        );

        expect(authService.authState, AuthState.pendingVerifyOTP);
      });
    });
  });
}
