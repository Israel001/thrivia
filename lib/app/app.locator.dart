// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, implementation_imports, depend_on_referenced_packages

import 'package:stacked_services/src/bottom_sheet/bottom_sheet_service.dart';
import 'package:stacked_services/src/dialog/dialog_service.dart';
import 'package:stacked_services/src/navigation/navigation_service.dart';
import 'package:stacked_shared/stacked_shared.dart';

import '../feat_auth/repository/auth_repository_service.dart';
import '../feat_auth/services/auth_service.dart';
import '../feat_cooperative/repository/cooperatives_repository_service.dart';
import '../feat_cooperative/repository/mock_cooperative_repository.dart';
import '../feat_users/repository/users_repository.dart';
import '../services/dio_service.dart';
import '../services/storage_service.dart';

final locator = StackedLocator.instance;

Future<void> setupLocator({
  String? environment,
  EnvironmentFilter? environmentFilter,
}) async {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  locator.registerLazySingleton(() => BottomSheetService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton<NavigationService>(() => NavigationService());
  locator.registerLazySingleton(() => AuthService());
  locator.registerLazySingleton<AuthRepository>(() => AuthRepository());
  locator.registerLazySingleton(() => DioService());
  locator.registerLazySingleton(() => StorageService());
  locator.registerLazySingleton<CooperativeRepository>(
      () => MockCooperativeRepository());
  locator.registerLazySingleton(() => UsersRepository());
}
