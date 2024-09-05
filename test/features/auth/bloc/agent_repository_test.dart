import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:space_traders/agent_repository.dart';
import 'package:space_traders/models/models.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  group('AgentRepository', () {
    late AgentRepository agentRepository;
    late Map<String, dynamic> mockResponse;
    late MockHttpClient mockHttpClient;

    setUpAll(() async {
      final file = File('test/mocks/mock_responses/create_agent.json');
      final jsonString = await file.readAsString();
      mockResponse = json.decode(jsonString);
      registerFallbackValue(
          Uri.parse('https://api.spacetraders.io/v2/register'));
    });

    setUp(() {
      mockHttpClient = MockHttpClient();
      agentRepository = AgentRepository(client: mockHttpClient);
    });

    test('registers a new agent', () async {
      when(() => mockHttpClient.post(
                any(),
                body: any(named: 'body'),
                headers: any(named: 'headers'),
              ))
          .thenAnswer(
              (_) async => http.Response(json.encode(mockResponse), 201));

      final result =
          await agentRepository.registerNewAgent('user_call_sign', 'COSMIC');

      expect(result, isA<Agent>());
      expect(
          result.accountId, equals(mockResponse['data']['agent']['accountId']));
      expect(result.symbol, equals(mockResponse['data']['agent']['symbol']));

      verify(() => mockHttpClient.post(
            any(),
            body: json.encode({
              'symbol': 'user_call_sign',
              'faction': 'COSMIC',
            }),
            headers: {'Content-Type': 'application/json'},
          )).called(1);
    });

    test('throws exception when registration fails', () async {
      when(() => mockHttpClient.post(
                any(),
                body: any(named: 'body'),
                headers: any(named: 'headers'),
              ))
          .thenAnswer((_) async => http.Response(
              '{"error": {"message": "Registration failed"}}', 400));

      expect(
        () => agentRepository.registerNewAgent('user_call_sign', 'COSMIC'),
        throwsA(isA<Exception>().having(
            (e) => e.toString(), 'message', contains('Registration failed'))),
      );
    });

    // test('retrieves a single agent');
    // test('retrieves a list of agents');

    // test('registering a user should store the jwt in local storage', () async {
    //   final agent = Agent();
    //   when(() => mockAuthRepository.registerNewAgent(any()))
    //       .thenAnswer((_) async => agent);
    //
    //   await agentRepository.registerNewAgent('user_call_sign');
    //   // verify(() => mockAuthRepository.registerUser('user_call_sign'));
    // });
    //
    // test('registerUser throws Exception on failure', () async {
    //   when(() => mockAuthRepository.registerNewAgent(any()))
    //       .thenThrow(Exception('Failed to register user'));
    //
    //   expect(
    //     () async => await agentRepository.registerNewAgent('user_call_sign'),
    //     throwsA(isA<Exception>()),
    //   );
    // });
  });
}
