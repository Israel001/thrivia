import 'package:stacked_services/stacked_services.dart';

class CustomNavService extends NavigationService {
  @override
  void config(
      {bool? enableLog,
      bool? defaultPopGesture,
      bool? defaultOpaqueRoute,
      Duration? defaultDurationTransition,
      bool? defaultGlobalState,
      Transition? defaultTransitionStyle,
      String? defaultTransition}) {
    // TODO: implement config
    super.config(
        enableLog: true,
        defaultPopGesture: defaultPopGesture,
        defaultOpaqueRoute: defaultOpaqueRoute,
        defaultDurationTransition: defaultDurationTransition,
        defaultGlobalState: defaultGlobalState,
        defaultTransitionStyle: defaultTransitionStyle,
        defaultTransition: defaultTransition);
  }
}



  // final logger = getLogger("StackedRouter");
  // @override
  // _i14.Route? onGenerateRoute(_i14.RouteSettings settings, [String? basePath]) {
  //   // TODO: implement onGenerateRoute
  //   logger.i(
  //       "Navigating to ${settings.name}, arguments ${settings.arguments.toString()}");
  //   return super.onGenerateRoute(settings, basePath);
  // }
