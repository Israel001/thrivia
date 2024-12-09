import 'package:flutter_test/flutter_test.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:thrivia_app/app/app.locator.dart';
import 'package:thrivia_app/feat_auth/ui/create_account/create_account_view.form.dart';
import 'package:thrivia_app/feat_auth/ui/create_account/create_account_viewmodel.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('CreateAccountViewModel Tests -', () {
    late NavigationService mockNavigationService;
    late CreateAccountViewModel model;
    setUp(() {
      registerServices();
      mockNavigationService = locator<NavigationService>();
      model = CreateAccountViewModel();
    });

    setUp(() {});
    group('Create Account - invalid info', () {
      test('test name', () {
        model.buttonPress();
        expect(model.hasAnyValidationMessage, true);
      });
    });

    group('Create Account - valid info', () {});

    group('Create Account - go to Login', () {});

    tearDown(() => locator.reset());
  });
}
