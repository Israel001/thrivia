// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked_services/stacked_services.dart';

import 'package:thrivia_app/app/app.bottomsheets.dart';
import 'package:thrivia_app/app/app.dialogs.dart';
import 'package:thrivia_app/app/app.locator.dart';
import 'package:thrivia_app/app/app.logger.dart';
import 'package:thrivia_app/app/app.router.dart';
import 'package:thrivia_app/common/app_theme.dart';
import 'package:thrivia_app/services/storage_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await setupLocator();
  final themeModeValue = await locator<StorageService>().getValue(
    StorageKeys.themeMode,
  );
  final themeMode =
      (themeModeValue ?? "light") == "light" ? ThemeMode.light : ThemeMode.dark;
  getLogger("mainMethod")
    ..i("Got themeMode value $themeModeValue from storage. ThemeMode is ${themeMode.name}")
    ..i("Overides:/nninitial location:${Overides.overrideInitialLocation}/nauthrepository: ${Overides.mockAuthRepository}");
  setupDialogUi();
  setupBottomSheetUi();
  runApp(
    MainApp(
      // themeMode: themeMode,
      themeMode: ThemeMode.light,
    ),
  );
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
      onGenerateRoute: (settings) {
        final logger = getLogger("StackedRouter");
        logger.i(
            "Navigating to ${settings.name}, arguments ${settings.arguments.toString()}");
        return StackedRouter().onGenerateRoute(settings);
      },
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
  static const overrideInitialLocation = Routes.bottomNavView;

  static const bool mockAuthRepository = true;

  static const bool mockCooperativeRepository = true;
}
