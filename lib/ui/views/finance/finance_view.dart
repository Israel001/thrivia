import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'finance_viewmodel.dart';

class FinanceView extends StackedView<FinanceViewModel> {
  const FinanceView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    FinanceViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      ),
    );
  }

  @override
  FinanceViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      FinanceViewModel();
}
