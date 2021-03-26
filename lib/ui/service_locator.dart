import 'package:get_it/get_it.dart';
import 'package:hr_app/services/navigation_service.dart';
import 'package:hr_app/api/api_service.dart';

GetIt locator = GetIt.I;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => APIService());
}
