import 'dart:async';
import 'dart:convert';
import 'package:thrivia_app/feat_auth/data_models/create_user_request.dart';
import 'package:thrivia_app/feat_cooperative/data_models/data_models.dart';
import 'package:thrivia_app/services/dio_service.dart';
import 'package:thrivia_app/app/app.locator.dart';
import 'package:thrivia_app/app/app.logger.dart';
import 'package:thrivia_app/common/api_constants.dart';
import 'package:thrivia_app/common/exceptions.dart';
import 'package:thrivia_app/feat_users/data_models/user.dart';

class UsersRepository {
  final _dio = locator<DioService>().dio;
  final _logger = getLogger("UsersRepositoryService");

  Future<User> createUser(CreateUserRequest newUser) async {
    final response = await _dio.postUri(
      Uri.https(ApiConstants.authority, ApiConstants.users),
      data: json.encode(newUser.toJson()),
    );
    if (response.statusCode != 201) {
      throw BackendException(
          message: 'Failed to create user',
          devDetails: "$response",
          prettyDetails: "Could not create user");
    }
    return User.fromJson(response.data);
  }

  Future<void> setActiveCooperative(String userId, String cooperativeId) async {
    _logger.v("Setting active cooperative for user $userId");

    final data = jsonEncode({"cooperativeId": cooperativeId});
    final response = await _dio.postUri(
      Uri.https(ApiConstants.authority, "/users/$userId/active-cooperative"),
      data: data,
    );

    if (response.statusCode == 200) {
      _logger.v("Active cooperative set successfully");
      return;
    }

    if (response.statusCode == 400) {
      _logger.v("Bad request");
      throw BackendException(
          message: "Bad request",
          devDetails: "$response",
          prettyDetails:
              "Error setting active cooperative: ${response.data.message}");
    }

    if (response.statusCode == 404) {
      _logger.v("User or cooperative not found");
      throw BackendException(
          message: "User or cooperative not found",
          devDetails: "$response",
          prettyDetails: "The specified user or cooperative does not exist");
    }

    _logger.v("Could not set active cooperative");
    throw BackendException(
        message: "Could not set active cooperative",
        devDetails: "$response",
        prettyDetails:
            "An error occurred while trying to set the active cooperative");
  }

  Future<List<Cooperative>> getCooperatives() async {
    _logger.v("Fetching cooperatives");

    final response = await _dio.getUri(
      Uri.https(ApiConstants.authority, "/cooperatives"),
    );

    if (response.statusCode == 200) {
      _logger.v("Cooperatives fetched successfully");
      return (response.data as List)
          .map((e) => Cooperative.fromJson(e))
          .toList();
    }

    _logger.v("Could not fetch cooperatives");
    throw BackendException(
        message: "Could not fetch cooperatives",
        devDetails: "$response",
        prettyDetails: "An error occurred while trying to fetch cooperatives");
  }

  Future<CooperativeApplication> createCooperativeApplication(
      Map<String, dynamic> applicationData) async {
    _logger.v("Creating cooperative application");

    final response = await _dio.postUri(
      Uri.https(ApiConstants.authority, "/cooperative-applications"),
      data: jsonEncode(applicationData),
    );

    if (response.statusCode == 201) {
      _logger.v("Cooperative application created successfully");
      return CooperativeApplication.fromJson(response.data);
    }

    _logger.v("Could not create cooperative application");
    throw BackendException(
        message: "Could not create cooperative application",
        devDetails: "$response",
        prettyDetails:
            "An error occurred while trying to create the cooperative application");
  }

  Future<CooperativeApplication> getCooperativeApplicationById(
      String applicationId) async {
    _logger.v("Fetching cooperative application with ID $applicationId");

    final response = await _dio.getUri(
      Uri.https(
          ApiConstants.authority, "/cooperative-applications/$applicationId"),
    );

    if (response.statusCode == 200) {
      _logger.v("Cooperative application fetched successfully");
      return CooperativeApplication.fromJson(response.data);
    }

    _logger.v("Could not fetch cooperative application");
    throw BackendException(
        message: "Could not fetch cooperative application",
        devDetails: "$response",
        prettyDetails:
            "An error occurred while trying to fetch the cooperative application");
  }

  Future<List<CooperativeApplication>> getCooperativeApplications() async {
    _logger.v("Fetching cooperative applications");

    final response = await _dio.getUri(
      Uri.https(ApiConstants.authority, "/cooperative-applications"),
    );

    if (response.statusCode == 200) {
      _logger.v("Cooperative applications fetched successfully");
      return (response.data as List)
          .map((e) => CooperativeApplication.fromJson(e))
          .toList();
    }

    _logger.v("Could not fetch cooperative applications");
    throw BackendException(
        message: "Could not fetch cooperative applications",
        devDetails: "$response",
        prettyDetails:
            "An error occurred while trying to fetch cooperative applications");
  }

  Future<List<Wallet>> getWallets(String cooperativeId) async {
    _logger.v("Fetching wallets for cooperative $cooperativeId");

    final response = await _dio.getUri(
      Uri.https(ApiConstants.authority, "/cooperatives/$cooperativeId/wallets"),
    );

    if (response.statusCode == 200) {
      _logger.v("Cooperative wallets fetched successfully");
      return (response.data as List).map((e) => Wallet.fromJson(e)).toList();
    }

    _logger.v("Could not fetch cooperative wallets");
    throw BackendException(
        message: "Could not fetch cooperative wallets",
        devDetails: "$response",
        prettyDetails:
            "An error occurred while trying to fetch cooperative wallets");
  }

  Future<void> depositToWallet(String walletId, double amount) async {
    _logger.v("Depositing to wallet $walletId");

    final data = jsonEncode({"amount": amount});
    final response = await _dio.postUri(
      Uri.https(ApiConstants.authority, "/wallets/$walletId/deposit"),
      data: data,
    );

    if (response.statusCode == 200) {
      _logger.v("Deposit successful");
      return;
    }

    _logger.v("Could not deposit to wallet");
    throw BackendException(
        message: "Could not deposit to wallet",
        devDetails: "$response",
        prettyDetails:
            "An error occurred while trying to deposit to the wallet");
  }

  Future<void> withdrawFromWallet(String walletId, double amount) async {
    _logger.v("Withdrawing from wallet $walletId");

    final data = jsonEncode({"amount": amount});
    final response = await _dio.postUri(
      Uri.https(ApiConstants.authority, "/wallets/$walletId/withdraw"),
      data: data,
    );

    if (response.statusCode == 200) {
      _logger.v("Withdrawal successful");
      return;
    }

    _logger.v("Could not withdraw from wallet");
    throw BackendException(
        message: "Could not withdraw from wallet",
        devDetails: "$response",
        prettyDetails:
            "An error occurred while trying to withdraw from the wallet");
  }

  Future<List<WithdrawalRequest>> getWithdrawalRequests(
      String cooperativeId) async {
    _logger.v("Fetching withdrawal requests for cooperative $cooperativeId");

    final response = await _dio.getUri(
      Uri.https(ApiConstants.authority,
          "/cooperatives/$cooperativeId/withdrawal-requests"),
    );

    if (response.statusCode == 200) {
      _logger.v("Withdrawal requests fetched successfully");
      return (response.data as List)
          .map((e) => WithdrawalRequest.fromJson(e))
          .toList();
    }

    _logger.v("Could not fetch withdrawal requests");
    throw BackendException(
        message: "Could not fetch withdrawal requests",
        devDetails: "$response",
        prettyDetails:
            "An error occurred while trying to fetch withdrawal requests");
  }

  Future<List<Transaction>> getTransactions(String walletId) async {
    _logger.v("Fetching transactions for wallet $walletId");

    final response = await _dio.getUri(
      Uri.https(ApiConstants.authority, "/wallets/$walletId/transactions"),
    );

    if (response.statusCode == 200) {
      _logger.v("Transactions fetched successfully");
      return (response.data as List)
          .map((e) => Transaction.fromJson(e))
          .toList();
    }

    _logger.v("Could not fetch transactions");
    throw BackendException(
        message: "Could not fetch transactions",
        devDetails: "$response",
        prettyDetails: "An error occurred while trying to fetch transactions");
  }
}

class CooperativeApplication {
  CooperativeApplication.fromJson(e) {}
}

class Transaction {
  Transaction.fromJson(e) {}
}
