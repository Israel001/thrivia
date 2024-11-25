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
    String text;
    try {
      text = viewModel.modelError?.prettyDetails;
    } catch (e) {
      text = "Unexpected Error Occured";
    }
    return viewModel.hasError
        ? Padding(
            padding: const EdgeInsets.only(
              top: 8,
            ),
            child: Text(
              text,
              style: theme.textTheme.bodyMedium!
                  .copyWith(color: theme.colorScheme.error),
            ),
          )
        : SizedBox.shrink();
  }
}
