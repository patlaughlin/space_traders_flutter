import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'models/models.dart';

class AgentRepository {
  final http.Client client;
  final SharedPreferences sharedPreferences;

  AgentRepository({required this.client, required this.sharedPreferences});

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
      final token = data['data']['token'];
      await sharedPreferences.setString('auth_token', token);
      return Agent.fromJson(data['data']['agent']);
    } else {
      throw Exception('Failed to register agent');
    }
  }

  String? getAuthToken() {
    try {
      return sharedPreferences.getString('auth_token');
    } catch (e) {
      throw Exception('No auth token found');
    }
  }

  Future<Agent> getCurrentUserAgent() async {
    final response = await client.post(
      Uri.parse('https://api.spacetraders.io/v2/my/agent'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      Agent agent = Agent.fromJson(data['data']);
      return agent;
    } else {
      throw Exception('Failed to retrieve agent');
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
