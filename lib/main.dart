// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

import 'package:thrivia_app/app/app.bottomsheets.dart';
import 'package:thrivia_app/app/app.dialogs.dart';
import 'package:thrivia_app/app/app.locator.dart';
import 'package:thrivia_app/app/app.router.dart';
import 'package:thrivia_app/common/app_theme.dart';
import 'package:thrivia_app/services/storage_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  final themeMode =
      (await locator<StorageService>().getValue(StorageKeys.themeMode)) ==
              "light"
          ? ThemeMode.light
          : ThemeMode.dark;

  setupDialogUi();
  setupBottomSheetUi();
  runApp(MainApp(
    themeMode: themeMode,
  ));
}

class MainApp extends StatelessWidget {
  final ThemeMode themeMode;
  const MainApp({
    Key? key,
    required this.themeMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Routes.startupView,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      navigatorObservers: [
        StackedService.routeObserver,
      ],
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,
    );
  }
}

abstract class Overides {
  static const overrideInitialLocation = null;
}
