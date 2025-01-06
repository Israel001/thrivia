import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:thrivia_app/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:thrivia_app/feat_auth/repository/auth_repository_service.dart';
import 'package:thrivia_app/feat_auth/services/auth_service.dart';
import 'package:thrivia_app/services/dio_service.dart';
import 'package:thrivia_app/services/storage_service.dart';
import 'package:thrivia_app/feat_cooperative/repository/cooperatives_repository_service.dart';

import 'package:thrivia_app/feat_users/repository/users_repository.dart';
// @stacked-import

import 'test_helpers.mocks.dart';

@GenerateMocks([], customMocks: [
  MockSpec<NavigationService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<BottomSheetService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<DialogService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<AuthRepository>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<DioService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<StorageService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<CooperativeRepository>(onMissingStub: OnMissingStub.returnDefault),
  // MockSpec<AuthService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<AuthService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<UsersRepository>(onMissingStub: OnMissingStub.returnDefault),
// @stacked-mock-spec
])
void registerServices() {
  getAndRegisterNavigationService();
  getAndRegisterBottomSheetService();
  getAndRegisterDialogService();
  getAndRegisterAuthRepositoryService();
  getAndRegisterDioService();
  getAndRegisterStorageService();

  getAndRegisterCooperativesRepositoryService();
  getAndRegisterAuthServiceService();
  getAndRegisterUsersRepositoryService();
// @stacked-mock-register
}

MockNavigationService getAndRegisterNavigationService() {
  _removeRegistrationIfExists<NavigationService>();
  final service = MockNavigationService();
  locator.registerSingleton<NavigationService>(service);
  return service;
}

MockBottomSheetService getAndRegisterBottomSheetService<T>({
  SheetResponse<T>? showCustomSheetResponse,
}) {
  _removeRegistrationIfExists<BottomSheetService>();
  final service = MockBottomSheetService();

  when(service.showCustomSheet<T, T>(
    enableDrag: anyNamed('enableDrag'),
    enterBottomSheetDuration: anyNamed('enterBottomSheetDuration'),
    exitBottomSheetDuration: anyNamed('exitBottomSheetDuration'),
    ignoreSafeArea: anyNamed('ignoreSafeArea'),
    isScrollControlled: anyNamed('isScrollControlled'),
    barrierDismissible: anyNamed('barrierDismissible'),
    additionalButtonTitle: anyNamed('additionalButtonTitle'),
    variant: anyNamed('variant'),
    title: anyNamed('title'),
    hasImage: anyNamed('hasImage'),
    imageUrl: anyNamed('imageUrl'),
    showIconInMainButton: anyNamed('showIconInMainButton'),
    mainButtonTitle: anyNamed('mainButtonTitle'),
    showIconInSecondaryButton: anyNamed('showIconInSecondaryButton'),
    secondaryButtonTitle: anyNamed('secondaryButtonTitle'),
    showIconInAdditionalButton: anyNamed('showIconInAdditionalButton'),
    takesInput: anyNamed('takesInput'),
    barrierColor: anyNamed('barrierColor'),
    barrierLabel: anyNamed('barrierLabel'),
    customData: anyNamed('customData'),
    data: anyNamed('data'),
    description: anyNamed('description'),
  )).thenAnswer((realInvocation) =>
      Future.value(showCustomSheetResponse ?? SheetResponse<T>()));

  locator.registerSingleton<BottomSheetService>(service);
  return service;
}

MockDialogService getAndRegisterDialogService() {
  _removeRegistrationIfExists<DialogService>();
  final service = MockDialogService();
  locator.registerSingleton<DialogService>(service);
  return service;
}

MockAuthRepository getAndRegisterAuthRepositoryService() {
  _removeRegistrationIfExists<AuthRepository>();
  final service = MockAuthRepository();
  locator.registerSingleton<AuthRepository>(service);
  return service;
}

MockDioService getAndRegisterDioService() {
  _removeRegistrationIfExists<DioService>();
  final service = MockDioService();
  locator.registerSingleton<DioService>(service);
  return service;
}

MockStorageService getAndRegisterStorageService() {
  _removeRegistrationIfExists<StorageService>();
  final service = MockStorageService();
  locator.registerSingleton<StorageService>(service);
  return service;
}

MockCooperativeRepository
    getAndRegisterCooperativesRepositoryService() {
  _removeRegistrationIfExists<CooperativeRepository>();
  final service = MockCooperativeRepository();
  locator.registerSingleton<CooperativeRepository>(service);
  return service;
}

MockAuthService getAndRegisterAuthServiceService() {
  _removeRegistrationIfExists<AuthService>();
  final service = MockAuthService();
  locator.registerSingleton<AuthService>(service);
  return service;
}

MockUsersRepository getAndRegisterUsersRepositoryService() {
  _removeRegistrationIfExists<UsersRepository>();
  final service = MockUsersRepository();
  locator.registerSingleton<UsersRepository>(service);
  return service;
}
// @stacked-mock-create

void _removeRegistrationIfExists<T extends Object>() {
  if (locator.isRegistered<T>()) {
    locator.unregister<T>();
  }
}
