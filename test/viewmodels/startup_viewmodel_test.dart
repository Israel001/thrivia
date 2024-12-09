import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:thrivia_app/app/app.locator.dart';
import 'package:thrivia_app/app/app.router.dart';
import 'package:thrivia_app/feat_startup/ui/splash/startup_viewmodel.dart';
import 'package:thrivia_app/main.dart';
// import 'package:thrivia_app/feat_startup/ui/splash/startup_viewmodel.dart';
import 'package:thrivia_app/services/storage_service.dart';

import '../helpers/test_helpers.dart';
import '../helpers/test_helpers.mocks.dart';

void main() {
  group('StartupViewModel Tests -', () {
    late NavigationService mockNavigationService;
    late StorageService mockStorageService;
    setUp(() {
      registerServices();
      mockNavigationService = locator<NavigationService>();
      mockStorageService = locator<StorageService>();
    });

    late StartupViewModel model;

    setUp(() {
      model = StartupViewModel();
    });
    // setUpAll(() {
    //   mockNavigationService = MockNavigationService();
    //   locator.registerSingleton<NavigationService>(mockNavigationService);
    //   mockStorageService = MockStorageService();

    //   locator.registerSingleton<StorageService>(mockStorageService);
    // });

    test('Initialize - runStartupLogic called', () async {
      await model.runStartupLogic();

      verify(mockStorageService.getValue(StorageKeys.onboarded));
    });
    test('Intialize - when not onboarded  - false', () async {
      if (Overides.overrideInitialLocation != null) return;
      when(mockStorageService.getValue(StorageKeys.onboarded))
          .thenAnswer((_) => Future.value("false"));

      expect(await mockStorageService.getValue(StorageKeys.onboarded), "false");

      await model.runStartupLogic();
      when(mockStorageService.getValue(StorageKeys.onboarded))
          .thenAnswer((_) => Future.value(null));
      expect(await mockStorageService.getValue(StorageKeys.onboarded), null);

      await model.runStartupLogic();

      verify(mockNavigationService.replaceWithOnboardingView()).called(2);
    });

    test('Initialize- when onboarded', () async {
      if (Overides.overrideInitialLocation != null) return;
      when(mockStorageService.getValue(StorageKeys.onboarded))
          .thenAnswer((value) => Future.value("true"));
      await model.runStartupLogic();
      verify(mockNavigationService.replaceWithLoginView());
    });

    test('Initialize- OverrideInitialLocation', () async {
      await model.runStartupLogic();
      if (Overides.overrideInitialLocation != null) {
        verify(mockNavigationService
            .replaceWith(Overides.overrideInitialLocation));
      } else {}
    });

    tearDown(() => locator.reset());
  });
}
