import 'package:get_it/get_it.dart';

import 'agent_repository.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton(() => AgentRepository());
}
