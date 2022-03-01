import 'package:appme/locator_services/app_navigator/app_navigator.dart';
import 'package:appme/locator_services/content_navigator/content_navigator.dart';
import 'package:appme/locator_services/drawer/drawer_service.dart';
import 'package:appme/locator_services/json/jsonreader.dart';
import 'package:appme/locator_services/storage_service/storage_service.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setUpLocator() {
  locator.registerLazySingleton(() => AppNavigator());
  locator.registerLazySingleton(() => ContentNavigator());
  locator.registerLazySingleton(() => DrawerService());
  locator.registerLazySingleton(() => JsonReader());
  locator.registerLazySingleton(() => StorageService());
}
