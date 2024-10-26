import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ModelErrorDisplay extends StatelessWidget {
  final FormViewModel viewModel;
  const ModelErrorDisplay({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return viewModel.hasError
        ? Padding(
            padding: const EdgeInsets.only(top: 8, left: 45),
            child: Text(
              viewModel.modelError?.prettyDetails,
              style: theme.textTheme.bodyMedium!
                  .copyWith(color: theme.colorScheme.error),
            ),
          )
        : SizedBox.shrink();
  }
}
