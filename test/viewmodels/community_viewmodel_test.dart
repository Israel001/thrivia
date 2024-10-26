import 'package:flutter_test/flutter_test.dart';
import 'package:thrivia_app/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('CommunityViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}