import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class HttpService {
  final String baseUrl = "https://api.spacetraders.io/v2";
  final SharedPreferences sharedPreferences;
  final http.Client client;
  late final String? _token;

  HttpService({required this.sharedPreferences, required this.client}) {
    try {
      _token = sharedPreferences.getString('auth_token');
    } catch (e) {
      throw Exception('No auth token found');
    }
  }

  Future<http.Response> post(String endpoint, Map<String, dynamic> body) async {
    return await client.post(
      Uri.parse('$baseUrl/$endpoint'),
      body: body,
      headers: {
        'Content-Type': 'application/json',
        "Authorization": "Bearer $_token"
      },
    );
  }

  Future<http.Response> get(String endpoint) async {
    return await client.get(
      Uri.parse('$baseUrl/$endpoint'),
      headers: {
        'Content-Type': 'application/json',
        "Authorization": "Bearer $_token"
      },
    );
  }

  Future<http.Response> put(String endpoint, Map<String, dynamic> body) async {
    return await client.put(
      Uri.parse('$baseUrl/$endpoint'),
      body: body,
      headers: {
        'Content-Type': 'application/json',
        "Authorization": "Bearer $_token"
      },
    );
  }

  Future<http.Response> delete(String endpoint) async {
    return await client.delete(
      Uri.parse('$baseUrl/$endpoint'),
      headers: {
        'Content-Type': 'application/json',
        "Authorization": "Bearer $_token"
      },
    );
  }

  Future<http.Response> patch(
      String endpoint, Map<String, dynamic> body) async {
    return await client.patch(
      Uri.parse('$baseUrl/$endpoint'),
      body: body,
      headers: {
        'Content-Type': 'application/json',
        "Authorization": "Bearer $_token"
      },
    );
  }

  Future<http.Response> head(String endpoint) async {
    return await client.head(
      Uri.parse('$baseUrl/$endpoint'),
      headers: {
        'Content-Type': 'application/json',
        "Authorization": "Bearer $_token"
      },
    );
  }
}
