import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:space_traders/agent_repository.dart';

class MockAuthRepository extends Mock implements AgentRepository {}

void main() {
  group('AuthRepository', () {
    late AgentRepository authRepository;
    late MockAuthRepository mockAuthRepository;

    setUp(() {
      mockAuthRepository = MockAuthRepository();
      authRepository = AgentRepository();
    });

    test('registers a new agent', () async {
      final agent = Agent();
      when(() => mockAuthRepository.registerNewAgent(any()))
          .thenAnswer((_) async => agent);

      final result = await authRepository.registerNewAgent('user_call_sign');
      expect(result, equals(agent));
    });

    // test('retrieves a single agent');
    // test('retrieves a list of agents');

    test('registering a user should store the jwt in local storage', () async {
      final agent = Agent();
      when(() => mockAuthRepository.registerNewAgent(any()))
          .thenAnswer((_) async => agent);

      await authRepository.registerNewAgent('user_call_sign');
      // verify(() => mockAuthRepository.registerUser('user_call_sign'));
    });

    test('registerUser throws Exception on failure', () async {
      when(() => mockAuthRepository.registerNewAgent(any()))
          .thenThrow(Exception('Failed to register user'));

      expect(
        () async => await authRepository.registerNewAgent('user_call_sign'),
        throwsA(isA<Exception>()),
      );
    });
  });
}
