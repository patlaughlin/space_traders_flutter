import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:space_traders/http_service.dart';

import 'agent_repository.dart';

final getIt = GetIt.instance;

void setupLocator() async {
  getIt.registerLazySingleton(() => AgentRepository());
  var sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(
      () => HttpService(sharedPreferences: sharedPreferences));
}
