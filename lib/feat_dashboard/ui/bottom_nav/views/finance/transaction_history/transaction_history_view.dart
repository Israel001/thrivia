// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:thrivia_app/app/app.dart';

import 'package:thrivia_app/feat_dashboard/ui/bottom_nav/components/transaction_list.dart';
import 'package:thrivia_app/feat_dashboard/ui/bottom_nav/views/home/home_viewmodel.dart';

import 'transaction_history_viewmodel.dart';

enum TransactionHistoryType {
  loans("Loan transactions"),
  savings("Savings");

  final String title;
  const TransactionHistoryType(this.title);
}

class TransactionHistoryView extends StackedView<TransactionHistoryViewModel> {
  final TransactionHistoryType transactionHistoryType;
  const TransactionHistoryView({
    super.key,
    required this.transactionHistoryType,
  });

  @override
  Widget builder(
    BuildContext context,
    TransactionHistoryViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text("Transaction history"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: TransactionList(
          title: transactionHistoryType.title,
          transactions: viewModel.contributionHistory,
        ),
      ),
    );
  }

  @override
  TransactionHistoryViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      TransactionHistoryViewModel();
}
