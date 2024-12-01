// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:thrivia_app/app/app.locator.dart';
import 'package:thrivia_app/app/app.router.dart';
import 'package:thrivia_app/feat_auth/ui/login/login_viewmodel.dart';
import 'package:thrivia_app/feat_dashboard/ui/bottom_nav/views/finance/transaction_history/transaction_history_view.dart';

class HomeViewModel extends BaseViewModel {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final _navigationService = locator<NavigationService>();
  void openEndDrawer() {
    scaffoldKey.currentState!.openDrawer();
  }

  void closeEndDrawer(BuildContext context) {
    Navigator.of(context).pop();
  }

  double _contributionBalance = 0;
  String get contributionBalanceText {
    final text = _contributionBalance.toStringAsFixed(2);
    return obscureContributionBalance ? "*" * text.length : text;
  }

  get showWithdrawButton => _contributionBalance > 0;

  bool _obscureContributionBalance = false;
  void toggleObscureContributionBalance() {
    _obscureContributionBalance = !_obscureContributionBalance;
    rebuildUi();
  }

  bool get obscureContributionBalance => _obscureContributionBalance;

  void addMoney() {}

  void withdrawMoney() {}

  double _loanBalance = 0;
  bool get showApplyLoan => _loanBalance == 0;

  String get loanBalanceText {
    final text = _loanBalance.toStringAsFixed(2);
    return obscureLoanBalance ? "*" * text.length : text;
  }

  int _currentPage = 0;
  int get currentPage => _currentPage;
  void pageChanged(int newPage) {
    _currentPage = newPage;
    rebuildUi();
  }

  bool _obscureLoanBalance = false;
  void toggleObscureLoanBalance() {
    _obscureLoanBalance = !_obscureLoanBalance;
    rebuildUi();
  }

  bool get obscureLoanBalance => _obscureLoanBalance;

  applyForLoan() {}

  repayLoan() {}

  List<TransactionModel> get recentAccountTransactions =>
      _recentAccountTransactions;
  List<TransactionModel> _recentAccountTransactions = List.generate(
      5,
      (index) => TransactionModel(
          transactionType: TransactionType.debit,
          transactionText: "Sent to Freedom cooper",
          transactionAmount: "3000",
          transactionTime: "14:40 PM"));

  List<TransactionModel> get recentLoanTransactions => _recentLoanTransactions;
  late List<TransactionModel> _recentLoanTransactions =
      _recentAccountTransactions;
  bool get hasContributionHistory => _recentAccountTransactions.isNotEmpty;
  bool get hasLoanHistory => _recentLoanTransactions.isNotEmpty;

  String userName = "Chinoney";

  bool get hasNotification => true;

  void joinCooperative() {
    _navigationService.navigateToJoinCooperativeView();
  }

  void viewAllContributions() {
    _navigationService.navigateToTransactionHistoryView(
        transactionHistoryType: TransactionHistoryType.savings);
  }

  void viewAllLoanHistory() {
    _navigationService.navigateToTransactionHistoryView(
        transactionHistoryType: TransactionHistoryType.loans);
  }
}

class TransactionModel {
  final TransactionType transactionType;
  final String transactionText;
  final String transactionAmount;
  final String transactionTime;
  TransactionModel({
    required this.transactionType,
    required this.transactionText,
    required this.transactionAmount,
    required this.transactionTime,
  });
}

enum TransactionType { debit, credit }
