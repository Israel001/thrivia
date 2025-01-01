import 'dart:async';
import 'package:thrivia_app/feat_auth/data_models/data_models.dart';
import 'package:thrivia_app/feat_cooperative/data_models/data_models.dart';
import 'package:thrivia_app/feat_cooperative/data_models/transactionResponse.dart';
import 'package:thrivia_app/feat_cooperative/repository/cooperatives_repository_service.dart';
import 'package:thrivia_app/feat_loan/data_models/loanResponse.dart';

class MockCooperativeRepository implements CooperativeRepository {
  @override
  Future<void> approveApplication(
      {required String uuid, required String applicationUuid}) {
    // TODO: implement approveApplication
    throw UnimplementedError();
  }

  @override
  Future<void> approveLoan({required String uuid, required String loanUuid}) {
    // TODO: implement approveLoan
    throw UnimplementedError();
  }

  @override
  Future<Payment> approveWithdrawalRequest(
      {required String uuid, required String requestUuid}) {
    // TODO: implement approveWithdrawalRequest
    throw UnimplementedError();
  }

  @override
  Future<Cooperative> createCooperative(CreateCooperativeRequest request) {
    // TODO: implement createCooperative
    throw UnimplementedError();
  }

  @override
  Future<TransactionResponse> deposit(
      {required String uuid,
      required String walletUuid,
      required DepositMoneyRequest depositMoneyRequest}) {
    // TODO: implement deposit
    throw UnimplementedError();
  }

  @override
  Future<Application> getApplication(
      {required String uuid, required String requestUuid}) {
    // TODO: implement getApplication
    throw UnimplementedError();
  }

  @override
  Future<List<Application>> getApplications(String uuid) {
    // TODO: implement getApplications
    throw UnimplementedError();
  }

  @override
  Future<List<Members>> getMembers(String uuid) {
    // TODO: implement getMembers
    throw UnimplementedError();
  }

  @override
  Future<List<LoanResponse>> getPendingLoans(String uuid) {
    // TODO: implement getPendingLoans
    throw UnimplementedError();
  }

  @override
  Future<List<LoanResponse>> getUserLoans(
      {required String uuid, required LoanStatus loanStatus}) {
    // TODO: implement getUserLoans
    throw UnimplementedError();
  }

  @override
  Future<List<TransactionResponse>> getWalletTransactions(
      {required String uuid, required String walletUuid}) {
    // TODO: implement getWalletTransactions
    throw UnimplementedError();
  }

  @override
  Future<List<Wallet>> getWallets(String uuid) {
    // TODO: implement getWallets
    throw UnimplementedError();
  }

  @override
  Future<List<Withdrawalrequest>> getWithdrawalRequests(String uuid) {
    // TODO: implement getWithdrawalRequests
    throw UnimplementedError();
  }

  @override
  Future<Withdrawalrequest> getWithdrawalReuest(
      {required String uuid, required String requestUuid}) {
    // TODO: implement getWithdrawalReuest
    throw UnimplementedError();
  }

  @override
  Future<RejectApplicationResponse> rejectApplication(
      {required String uuid, required String requestUuid}) {
    // TODO: implement rejectApplication
    throw UnimplementedError();
  }

  @override
  Future<RejectApplicationResponse> rejectLoan(
      {required String uuid, required String loanUuid}) {
    // TODO: implement rejectLoan
    throw UnimplementedError();
  }

  @override
  Future<RejectApplicationResponse> rejectWithdrawalRequest(
      {required String uuid, required String requestUuid}) {
    // TODO: implement rejectWithdrawalRequest
    throw UnimplementedError();
  }

  @override
  Future<Payment> verifyTransaction(
      {required String transactionId,
      required PaymentInfoRequest paymentInfo}) {
    // TODO: implement verifyTransaction
    throw UnimplementedError();
  }

  @override
  Future<Payment> withdraw(
      {required String uuid,
      required String walletUuid,
      required PaymentInfoRequest paymentInfo}) {
    // TODO: implement withdraw
    throw UnimplementedError();
  }
}
