import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:thrivia_app/app/app.locator.dart';
import 'package:thrivia_app/app/app.router.dart';
import 'package:thrivia_app/feat_dashboard/ui/bottom_nav/views/finance/transaction_history/transaction_history_view.dart';
import 'package:thrivia_app/feat_dashboard/ui/bottom_nav/views/home/home_viewmodel.dart';

class FinanceViewModel extends BaseViewModel {
  // final tabController = TabController(length: 2, vsync: vsync);

  final _navigationService = locator<NavigationService>();
  FinanceViewModel() {
    loanCardController = LoanCardController(this);
    contributionCardController = ContributionCardController(this);
  }
  late LoanCardController loanCardController;
  late ContributionCardController contributionCardController;
  List<TransactionModel> _loanHistory = List.generate(
      5,
      (index) => TransactionModel(
          transactionType: TransactionType.debit,
          transactionText: "Sent to Freedom cooper",
          transactionAmount: "3000",
          transactionTime: "14:40 PM"));

  List<TransactionModel> get loanHistory => _loanHistory;
  late List<TransactionModel> _contributionHistory = _loanHistory;

  List<TransactionModel> get contributionHistory => _contributionHistory;

  void viewAllContributions() {
    _navigationService.navigateToTransactionHistoryView(
        transactionHistoryType: TransactionHistoryType.savings);
  }

  void viewAllLoanHistory() {
    _navigationService.navigateToTransactionHistoryView(
        transactionHistoryType: TransactionHistoryType.loans);
  }
}

class LoanCardController {
  final BaseViewModel viewModel;

  bool _obscureLoanBalance = false;

  LoanCardController(this.viewModel);
  void toggleObscureLoanBalance() {
    _obscureLoanBalance = !_obscureLoanBalance;
    viewModel.rebuildUi();
  }

  bool get obscureLoanBalance => _obscureLoanBalance;

  applyForLoan() {}

  repayLoan() {}

  double _loanBalance = 0;
  bool get showApplyLoan => _loanBalance == 0;

  String get loanBalanceText {
    final text = _loanBalance.toStringAsFixed(2);
    return obscureLoanBalance ? "*" * text.length : text;
  }
}

class ContributionCardController {
  final BaseViewModel viewModel;

  ContributionCardController(this.viewModel);

  double _contributionBalance = 0;
  String get contributionBalanceText {
    final text = _contributionBalance.toStringAsFixed(2);
    return obscureContributionBalance ? "*" * text.length : text;
  }

  get showWithdrawButton => _contributionBalance > 0;

  bool _obscureContributionBalance = false;
  void toggleObscureContributionBalance() {
    _obscureContributionBalance = !_obscureContributionBalance;
    viewModel.rebuildUi();
  }

  bool get obscureContributionBalance => _obscureContributionBalance;

  void addMoney() {}

  void withdrawMoney() {}
}
