import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:space_traders/http_service.dart';

import 'agent_repository.dart';

import 'package:http/http.dart' as http;

final getIt = GetIt.instance;

void setupLocator() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  final client = http.Client();
  getIt.registerLazySingleton(() => AgentRepository(client: client, sharedPreferences: sharedPreferences));
  getIt.registerLazySingleton(
      () => HttpService(sharedPreferences: sharedPreferences, client: client));
}
