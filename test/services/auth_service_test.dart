import 'package:flutter_test/flutter_test.dart';
import 'package:thrivia_app/app/app.locator.dart';

import '../helpers/test_helpers.dart';
import '../helpers/test_helpers.mocks.dart';

void main() {
  group('AuthServiceTest -', () {
    setUp(() => registerServices());

    final mockAuthService = MockAuthRepository();
    tearDown(() => locator.reset());
  });
}
