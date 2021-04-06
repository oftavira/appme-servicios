import 'package:appme/services/drawer_service.dart';
import 'package:appme/services/jsonreader.dart';
import 'package:appme/services/navigation_service.dart';
import 'package:appme/services/storage_service.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setUpLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DrawerService());
  locator.registerLazySingleton(() => JsonReader());
  locator.registerLazySingleton(() => StorageService());
}
