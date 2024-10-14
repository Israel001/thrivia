import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'onboarding4_viewmodel.dart';

class Onboarding4View extends StackedView<Onboarding4ViewModel> {
  const Onboarding4View({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    Onboarding4ViewModel viewModel,
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
  Onboarding4ViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      Onboarding4ViewModel();
}
