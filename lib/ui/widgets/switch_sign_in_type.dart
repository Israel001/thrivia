// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:thrivia_app/app/app.locator.dart';
import 'package:thrivia_app/app/app.router.dart';
import 'package:thrivia_app/common/app_colors.dart';

class SwitchSignInType extends StatelessWidget {
  final bool onLoginPage;

  final bool onDark;
  const SwitchSignInType({
    Key? key,
    required this.onLoginPage,
    this.onDark = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          onLoginPage ? "Don’t have an account? " : 'Already have an account? ',
          style: theme.textTheme.bodySmall?.copyWith(
              color: onDark
                  ? theme.colorScheme.primary
                  : theme.colorScheme.onPrimary),
        ),
        GestureDetector(
          onTap: () {
            final navigator = locator<NavigationService>();
            onLoginPage
                ? navigator.replaceWithCreateAccountView()
                : navigator.replaceWithLoginView();
          },
          child: Text(
            onLoginPage ? "Create one" : 'Log in',
            style: theme.textTheme.bodySmall!.copyWith(
              color: AppColors.k_272816C,
              fontWeight: FontWeight.w700,
              decorationColor: AppColors.k_272816C,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}
