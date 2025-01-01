import 'dart:async';
import 'dart:convert';
import 'package:thrivia_app/feat_auth/data_models/data_models.dart';
import 'package:thrivia_app/feat_cooperative/data_models/data_models.dart';
import 'package:thrivia_app/feat_cooperative/data_models/transactionResponse.dart';
import 'package:thrivia_app/feat_loan/data_models/loanResponse.dart';
import 'package:thrivia_app/services/dio_service.dart';
import 'package:thrivia_app/app/app.locator.dart';
import 'package:thrivia_app/app/app.logger.dart';
import 'package:thrivia_app/common/api_constants.dart';
import 'package:thrivia_app/common/exceptions.dart';

class CooperativeRepository {
  final _dio = locator<DioService>().dio;
  final _logger = getLogger("CooperativeRepository");

  // final String baseUrl = 'https://${ApiConstants.authority}/api';

  Future<void> approveApplication(
      {required String uuid, required String applicationUuid}) async {
    final response = await _dio.postUri(
      Uri.https(ApiConstants.authority,
          '${ApiConstants.cooperatives}/$uuid/${ApiConstants.applications}/$applicationUuid/approve'),
    );
    if (response.statusCode != 200) {
      throw BackendException(
          message: 'Failed to approve application',
          devDetails: "$response",
          prettyDetails: "Could not approve application");
    }
  }

  Future<void> approveLoan(
      {required String uuid, required String loanUuid}) async {
    final response = await _dio.postUri(
      Uri.https(ApiConstants.authority,
          '${ApiConstants.cooperatives}/$uuid/${ApiConstants.loans}/$loanUuid/approve'),
    );
    if (response.statusCode != 200) {
      throw BackendException(
          message: 'Failed to approve loan',
          devDetails: "$response",
          prettyDetails: "Could not approve loan");
    }
  }

  Future<Payment> approveWithdrawalRequest(
      {required String uuid, required String requestUuid}) async {
    final response = await _dio.postUri(
      Uri.https(ApiConstants.authority,
          '${ApiConstants.cooperatives}/$uuid/${ApiConstants.withdrawals}/$requestUuid/approve'),
    );
    if (response.statusCode != 200) {
      throw BackendException(
          message: 'Failed to approve withdrawal request',
          devDetails: "$response",
          prettyDetails: "Could not approve withdrawal request");
    }
    return Payment.fromJson(response.data);
  }

  Future<Cooperative> createCooperative(
      CreateCooperativeRequest request) async {
    final response = await _dio.postUri(
      Uri.https(ApiConstants.authority, '${ApiConstants.cooperatives}'),
      data: json.encode(request.toJson()),
    );
    if (response.statusCode != 201) {
      throw BackendException(
          message: 'Failed to create cooperative',
          devDetails: "$response",
          prettyDetails: "Could not create cooperative");
    }
    return Cooperative.fromJson(response.data);
  }

  Future<TransactionResponse> deposit(
      {required String uuid,
      required String walletUuid,
      required DepositMoneyRequest depositMoneyRequest}) async {
    final response = await _dio.postUri(
      Uri.https(ApiConstants.authority,
          '${ApiConstants.cooperatives}/$uuid/${ApiConstants.wallets}/$walletUuid/deposit'),
      data: json.encode(depositMoneyRequest.toJson()),
    );
    if (response.statusCode != 200) {
      throw BackendException(
          message: 'Failed to deposit money',
          devDetails: "$response",
          prettyDetails: "Could not deposit money");
    }
    return TransactionResponse.fromJson(response.data);
  }

  Future<Application> getApplication(
      {required String uuid, required String requestUuid}) async {
    final response = await _dio.getUri(
      Uri.https(ApiConstants.authority,
          '${ApiConstants.cooperatives}/$uuid/${ApiConstants.applications}/$requestUuid'),
    );
    if (response.statusCode != 200) {
      throw BackendException(
          message: 'Failed to get application',
          devDetails: "$response",
          prettyDetails: "Could not get application");
    }
    return Application.fromJson(response.data);
  }

  Future<List<Application>> getApplications(String uuid) async {
    final response = await _dio.getUri(
      Uri.https(ApiConstants.authority,
          '${ApiConstants.cooperatives}/$uuid/${ApiConstants.applications}'),
    );
    if (response.statusCode != 200) {
      throw BackendException(
          message: 'Failed to get applications',
          devDetails: "$response",
          prettyDetails: "Could not get applications");
    }
    Iterable list = response.data;
    return list.map((model) => Application.fromJson(model)).toList();
  }

  Future<List<Members>> getMembers(String uuid) async {
    final response = await _dio.getUri(
      Uri.https(ApiConstants.authority,
          '${ApiConstants.cooperatives}/$uuid/${ApiConstants.members}'),
    );
    if (response.statusCode != 200) {
      throw BackendException(
          message: 'Failed to get members',
          devDetails: "$response",
          prettyDetails: "Could not get members");
    }
    Iterable list = response.data;
    return list.map((model) => Members.fromJson(model)).toList();
  }

  Future<List<LoanResponse>> getPendingLoans(String uuid) async {
    final response = await _dio.getUri(
      Uri.https(ApiConstants.authority,
          '${ApiConstants.cooperatives}/$uuid/${ApiConstants.loans}/pending'),
    );
    if (response.statusCode != 200) {
      throw BackendException(
          message: 'Failed to get pending loans',
          devDetails: "$response",
          prettyDetails: "Could not get pending loans");
    }
    Iterable list = response.data;
    return list.map((model) => LoanResponse.fromJson(model)).toList();
  }

  Future<List<LoanResponse>> getUserLoans(
      {required String uuid, required LoanStatus loanStatus}) async {
    final response = await _dio.getUri(
      Uri.https(ApiConstants.authority,
          '${ApiConstants.cooperatives}/$uuid/${ApiConstants.loans}?status=${loanStatus.toString().split('.').last}'),
    );
    if (response.statusCode != 200) {
      throw BackendException(
          message: 'Failed to get user loans',
          devDetails: "$response",
          prettyDetails: "Could not get user loans");
    }
    Iterable list = response.data;
    return list.map((model) => LoanResponse.fromJson(model)).toList();
  }

  Future<List<TransactionResponse>> getWalletTransactions(
      {required String uuid, required String walletUuid}) async {
    final response = await _dio.getUri(
      Uri.https(ApiConstants.authority,
          '${ApiConstants.cooperatives}/$uuid/${ApiConstants.wallets}/$walletUuid/transactions'),
    );
    if (response.statusCode != 200) {
      throw BackendException(
          message: 'Failed to get wallet transactions',
          devDetails: "$response",
          prettyDetails: "Could not get wallet transactions");
    }
    Iterable list = response.data;
    return list.map((model) => TransactionResponse.fromJson(model)).toList();
  }

  Future<List<Wallet>> getWallets(String uuid) async {
    final response = await _dio.getUri(
      Uri.https(ApiConstants.authority,
          '${ApiConstants.cooperatives}/$uuid/${ApiConstants.wallets}'),
    );
    if (response.statusCode != 200) {
      throw BackendException(
          message: 'Failed to get wallets',
          devDetails: "$response",
          prettyDetails: "Could not get wallets");
    }
    Iterable list = response.data;
    return list.map((model) => Wallet.fromJson(model)).toList();
  }

  Future<List<Withdrawalrequest>> getWithdrawalRequests(String uuid) async {
    final response = await _dio.getUri(
      Uri.https(ApiConstants.authority,
          '${ApiConstants.cooperatives}/$uuid/${ApiConstants.withdrawals}'),
    );
    if (response.statusCode != 200) {
      throw BackendException(
          message: 'Failed to get withdrawal requests',
          devDetails: "$response",
          prettyDetails: "Could not get withdrawal requests");
    }
    Iterable list = response.data;
    return list.map((model) => Withdrawalrequest.fromJson(model)).toList();
  }

  Future<Withdrawalrequest> getWithdrawalReuest(
      {required String uuid, required String requestUuid}) async {
    final response = await _dio.getUri(
      Uri.https(ApiConstants.authority,
          '${ApiConstants.cooperatives}/$uuid/${ApiConstants.withdrawals}/$requestUuid'),
    );
    if (response.statusCode != 200) {
      throw BackendException(
          message: 'Failed to get withdrawal request',
          devDetails: "$response",
          prettyDetails: "Could not get withdrawal request");
    }
    return Withdrawalrequest.fromJson(response.data);
  }

  Future<RejectApplicationResponse> rejectApplication(
      {required String uuid, required String requestUuid}) async {
    final response = await _dio.postUri(
      Uri.https(ApiConstants.authority,
          '${ApiConstants.cooperatives}/$uuid/${ApiConstants.applications}/$requestUuid/reject'),
    );
    if (response.statusCode != 200) {
      throw BackendException(
          message: 'Failed to reject application',
          devDetails: "$response",
          prettyDetails: "Could not reject application");
    }
    return RejectApplicationResponse.fromJson(response.data);
  }

  Future<RejectApplicationResponse> rejectLoan(
      {required String uuid, required String loanUuid}) async {
    final response = await _dio.postUri(
      Uri.https(ApiConstants.authority,
          '${ApiConstants.cooperatives}/$uuid/${ApiConstants.loans}/$loanUuid/reject'),
    );
    if (response.statusCode != 200) {
      throw BackendException(
          message: 'Failed to reject loan',
          devDetails: "$response",
          prettyDetails: "Could not reject loan");
    }
    return RejectApplicationResponse.fromJson(response.data);
  }

  Future<RejectApplicationResponse> rejectWithdrawalRequest(
      {required String uuid, required String requestUuid}) async {
    final response = await _dio.postUri(
      Uri.https(ApiConstants.authority,
          '${ApiConstants.cooperatives}/$uuid/${ApiConstants.withdrawals}/$requestUuid/reject'),
    );
    if (response.statusCode != 200) {
      throw BackendException(
          message: 'Failed to reject withdrawal request',
          devDetails: "$response",
          prettyDetails: "Could not reject withdrawal request");
    }
    return RejectApplicationResponse.fromJson(response.data);
  }

  Future<Payment> verifyTransaction(
      {required String transactionId,
      required PaymentInfoRequest paymentInfo}) async {
    final response = await _dio.postUri(
      Uri.https(ApiConstants.authority,
          '${ApiConstants.transactions}/$transactionId/verify'),
      data: json.encode(paymentInfo.toJson()),
    );
    if (response.statusCode != 200) {
      throw BackendException(
          message: 'Failed to verify transaction',
          devDetails: "$response",
          prettyDetails: "Could not verify transaction");
    }
    return Payment.fromJson(response.data);
  }

  Future<Payment> withdraw(
      {required String uuid,
      required String walletUuid,
      required PaymentInfoRequest paymentInfo}) async {
    final response = await _dio.postUri(
      Uri.https(ApiConstants.authority,
          '${ApiConstants.cooperatives}/$uuid/${ApiConstants.wallets}/$walletUuid/withdraw'),
      data: json.encode(paymentInfo.toJson()),
    );
    if (response.statusCode != 200) {
      throw BackendException(
          message: 'Failed to withdraw',
          devDetails: "$response",
          prettyDetails: "Could not withdraw");
    }
    return Payment.fromJson(response.data);
  }
}
