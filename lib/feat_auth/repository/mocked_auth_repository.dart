import 'dart:async';
import 'package:thrivia_app/app/app.logger.dart';
import 'package:thrivia_app/common/exceptions.dart';
import 'package:thrivia_app/feat_auth/data_models/data_models.barrel.dart';
import 'package:thrivia_app/feat_auth/data_models/login_user_response.dart';
import 'package:thrivia_app/feat_users/data_models/user.dart';
import 'package:thrivia_app/feat_auth/repository/auth_repository_service.dart';
import 'package:thrivia_app/feat_auth/services/auth_service.dart';

class MockedAuthRepository implements AuthRepository {
  final _logger = getLogger("MockAuthRepository");

  var createAccountResponse =
      CreateAccountResponse(pinId: "pinId", uuid: "uuid");
  var loginResponse = LoginResponse(
      accessToken: "accessToken",
      expiresIn: 12000,
      refreshToken: "refreshToken",
      user: User(
          uuid: "uuid",
          deletedAt: "deletedAt",
          firstName: "firstName",
          lastName: "lastName",
          phoneNumber: "phoneNumber",
          email: "email",
          membershipNo: "membershipNo",
          dateOfBirth: "dateOfBirth",
          address: "address",
          phoneVerified: true,
          lastLoggedIn: DateTime.now(),
          incomeSource: "incomeSource",
          employmentDetails: "employmentDetails",
          additionalDetails: "additionalDetails",
          bvn: "bvn",
          nin: "nin",
          accountName: "accountName",
          accountReference: "accountReference",
          bankAccounts: "bankAccounts",
          providerResponse: "providerResponse",
          activeCooperative: "activeCooperative"));

  @override
  FutureOr<CreateAccountResponse> createAccount(
      CreateUserRequest newUser) async {
    _logger.v("creating user");

    final statusCode = 201;

    if (statusCode == 201) {
      return createAccountResponse;
    }

    if (statusCode == 409) {
      _logger.v("Account already exists");

      throw BackendException(
          message: "Account already exists",
          devDetails: "response",
          prettyDetails: "Sorry, this account exists already");
    }

    if (statusCode == 400) {
      _logger.v("Bad request");

      throw BackendException(
          message: "Bad request",
          devDetails: "response",
          prettyDetails: "Error creating account: ");
    }
    _logger.v("Could not create account");

    throw BackendException(
        message: "Could not create account",
        // devDetails: "${response.data.message}",
        prettyDetails: "An error occured while trying to create your account");
  }

  @override
  FutureOr<dynamic> loginUser(LoginUserRequest userLogin) async {
    _logger.v("Logging in user");

    final statusCode = 405;

    if (statusCode == 201) {
      _logger.v("user authorised");

      // return loginResponse;
      try {
        _logger.v("user not verified, received otp details");
        return createAccountResponse;
      } catch (e) {
        _logger.wtf(
            "Unexpected error, user logged in but response is not otp or login response");
        throw BackendException(
            message: "User login succesfull, but response is invalid",
            devDetails: e.toString(),
            prettyDetails: "Unexpected error encountered while logging you in");
      }
    }

    if (statusCode == 405) {
      throw BackendException(
          message: "User login failed",
          // devDetails: "$response",
          prettyDetails: "Incorrect login details");
    }
    throw BackendException(
        message: "Unable to login User",
        // devDetails: "$response",
        prettyDetails:
            "Unexpected error encountered while trying to log you in");
  }

  @override
  FutureOr<dynamic> verifyOTP(VerifyOTPBody tokenData) async {
    final statusCode = 201;

    if (statusCode == 201) {
      _logger.v("OTP verified successfully");

      return "otp";
    }
    if (statusCode == 401) {
      _logger.v("OTP is not valid");
      throw BackendException(
          message: "Invalid OTP",
          // devDetails: "$response",
          prettyDetails: "Invalid OTP");
    }

    throw BackendException(
        message: "Unexpected Response",
        // devDetails: "$response",
        prettyDetails:
            "Unexpected error encountered while trying to verify your OTP");
  }

  @override
  FutureOr<String> requestOTP(SendOTPRequest sendOTPData) async {
    final statusCode = 301;

    if (statusCode == 201) {
      _logger.v("OTP sent successfully");
      return "response.data";
    }
    throw BackendException(
        message: "Unexpected Response",
        // devDetails: "$response",
        prettyDetails: "Unexpected error encountered while sending your OTP");
  }

  @override
  FutureOr<VerifyOTPBody> initiateResetPassword(String emailOrPhoneNumber) {
    final VerifyOTPBody otpData = VerifyOTPBody(
        otpActionType: OtpActionType.RESET_PASSWORD,
        // otpVerifyId: null,
        otp: null,
        pinId: " ",
        userUuid: " ");
    return otpData;
  }

  @override
  FutureOr<void> resetPassword(
      {required String newPassword, required String accessToken}) {
    // TODO: implement resetPassword
    return null;
  }
}
