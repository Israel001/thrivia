import 'dart:async';

import 'package:thrivia_app/feat_auth/data_models/data_models.dart';
import 'package:thrivia_app/feat_cooperative/data_models/data_models.dart';
import 'package:thrivia_app/feat_cooperative/data_models/transactionResponse.dart';
import 'package:thrivia_app/feat_loan/data_models/loanResponse.dart';

abstract class CooperativeRepository {
  FutureOr<Cooperative> createCooperative(CreateCooperativeRequest request);

  FutureOr<List<Wallet>> getWallets(String uuid);

  FutureOr<List<Application>> getApplications(String uuid);

  FutureOr<List<Members>> getMembers(String uuid);

  FutureOr<List<Withdrawalrequest>> getWithdrawalRequests(String uuid);

  FutureOr<void> approveApplication({
    required String uuid,
    required String applicationUuid,
  });

  FutureOr<Payment> approveWithdrawalRequest({
    required String uuid,
    required String requestUuid,
  });

  FutureOr<RejectApplicationResponse> rejectApplication({
    required String uuid,
    required String requestUuid,
  });

  FutureOr<RejectApplicationResponse> rejectWithdrawalRequest({
    required String uuid,
    required String requestUuid,
  });

  FutureOr<Application> getApplication({
    required String uuid,
    required String requestUuid,
  });

  FutureOr<Withdrawalrequest> getWithdrawalReuest({
    required String uuid,
    required String requestUuid,
  });

  FutureOr<Payment> verifyTransaction({
    required String transactionId,
    required PaymentInfoRequest paymentInfo,
  });

  FutureOr<TransactionResponse> deposit(
      {required String uuid,
      required String walletUuid,
      required DepositMoneyRequest depositMoneyRequest});

  FutureOr<Payment> withdraw({
    required String uuid,
    required String walletUuid,
    required PaymentInfoRequest paymentInfo,
  });

  FutureOr<List<TransactionResponse>> getWalletTransactions({
    required String uuid,
    required String walletUuid,
  });

  FutureOr<List<LoanResponse>> getUserLoans({
    required String uuid,
    required LoanStatus loanStatus,
  });

  FutureOr<List<LoanResponse>> getPendingLoans(String uuid);

  FutureOr<void> approveLoan({
    required String uuid,
    required String loanUuid,
  });

  FutureOr<RejectApplicationResponse> rejectLoan({
    required String uuid,
    required String loanUuid,
  });
}
