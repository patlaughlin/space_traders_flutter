// test/http_service_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:space_traders/http_service.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

class MockClient extends Mock implements http.Client {}

void main() {
  late MockSharedPreferences mockSharedPreferences;
  late MockClient mockClient;
  late HttpService httpService;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    when(() => mockSharedPreferences.getString(any())).thenReturn('test-token');

    mockClient = MockClient();
    httpService = HttpService(
      sharedPreferences: mockSharedPreferences,
      client: mockClient,
    );

    registerFallbackValue(Uri());
  });

  group('HttpService', () {
    test('should always include the Bearer Token if available', () async {
      final response = http.Response('{"success": true}', 200);

      when(() => mockClient.get(
            any(),
            headers: any(named: 'headers'),
          )).thenAnswer((_) async => response);

      await httpService.get('test-endpoint');

      verify(() => mockClient.get(
            any(),
            headers: {
              'Content-Type': 'application/json',
              'Authorization': 'Bearer test-token',
            },
          )).called(1);
    });

    test('post method makes correct HTTP request', () async {
      const endpoint = 'test-endpoint';
      final body = {'key': 'value'};
      final response = http.Response('{"success": true}', 200);

      when(() => mockClient.post(
            Uri.parse('${httpService.baseUrl}/$endpoint'),
            body: body,
            headers: {
              'Content-Type': 'application/json',
              'Authorization': 'Bearer test-token',
            },
          )).thenAnswer((_) async => response);

      final result = await httpService.post(endpoint, body);

      expect(result.statusCode, 200);
      verify(() => mockClient.post(
            Uri.parse('${httpService.baseUrl}/$endpoint'),
            body: body,
            headers: {
              'Content-Type': 'application/json',
              'Authorization': 'Bearer test-token',
            },
          )).called(1);
    });

    test('get method makes correct HTTP request', () async {
      const endpoint = 'test-endpoint';
      final response = http.Response('{"success": true}', 200);

      when(() => mockClient.get(
            Uri.parse('${httpService.baseUrl}/$endpoint'),
            headers: {
              'Content-Type': 'application/json',
              'Authorization': 'Bearer test-token',
            },
          )).thenAnswer((_) async => response);

      final result = await httpService.get(endpoint);

      expect(result.statusCode, 200);
      verify(() => mockClient.get(
            Uri.parse('${httpService.baseUrl}/$endpoint'),
            headers: {
              'Content-Type': 'application/json',
              'Authorization': 'Bearer test-token',
            },
          )).called(1);
    });

    // Similarly, add tests for put, delete, patch, and head methods
  });
}
