import 'dart:convert';

import 'package:http/http.dart' as http;

import 'models/models.dart';

class AgentRepository {
  final http.Client client;

  AgentRepository({required this.client});

  Future<Agent> registerNewAgent(String symbol, String faction) async {
    final response = await client.post(
      Uri.parse('https://api.spacetraders.io/v2/register'),
      body: json.encode({
        'symbol': symbol,
        'faction': faction,
      }),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 201) {
      final data = json.decode(response.body);
      return Agent.fromJson(data['data']['agent']);
    } else {
      throw Exception('Failed to register agent');
    }
  }
// final AuthLocalDataSource localDataSource;
//
// AuthRepository({required this.localDataSource});
//
// User? getUser() {
//   return localDataSource.getUser();
// }
}
