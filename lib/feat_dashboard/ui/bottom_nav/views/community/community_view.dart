import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'community_viewmodel.dart';

class CommunityView extends StackedView<CommunityViewModel> {
  const CommunityView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CommunityViewModel viewModel,
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
  CommunityViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      CommunityViewModel();
}
