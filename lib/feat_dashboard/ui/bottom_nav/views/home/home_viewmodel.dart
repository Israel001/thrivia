// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

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

  bool _obscureLoanBalance = false;

  int _currentPage = 0;
  int get currentPage => _currentPage;
  void pageChanged(int newPage) {
    _currentPage = newPage;
    rebuildUi();
  }

  void toggleObscureLoanBalance() {
    _obscureLoanBalance = !_obscureLoanBalance;
    rebuildUi();
  }

  bool get obscureLoanBalance => _obscureLoanBalance;

  applyForLoan() {}

  repayLoan() {}

  List<TransactionModel> get recentAccoutTransactions =>
      _recentAccountTransactions;
  List<TransactionModel> _recentAccountTransactions = List.generate(
      5,
      (index) => TransactionModel(
          transactionType: TransactionType.debit,
          transactionText: "Sent to Freedom cooper",
          transactionAmount: "3000",
          transactionTime: "14:40 PM"));

  List<TransactionModel> get recentLoanTransactions => recentLoanTransactions;
  List<TransactionModel> _recentLoanTransactions = [];
  bool get hasContributionHistory => _recentAccountTransactions.isNotEmpty;
  bool get hasLoanHistory => _recentLoanTransactions.isNotEmpty;

  String userName = "Chinoney";

  bool get hasNotification => true;

  void joinCooperative() {}

  void addCooperative() {}
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
