import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:space_traders/agent_repository.dart';
import 'package:space_traders/features/auth/bloc/auth_bloc.dart';
import 'package:space_traders/service_locator.dart';

import '../../../mocks/mock_agent.dart';

class MockAgentRepository extends Mock implements AgentRepository {}

void main() {
  group('AuthBloc', () {
    late AuthBloc authBloc;
    late MockAgentRepository mockAgentRepository;

    setUp(() {
      mockAgentRepository = MockAgentRepository();
      getIt.reset();
      getIt.registerLazySingleton<AgentRepository>(() => mockAgentRepository);

      authBloc = AuthBloc();
    });

    tearDown(() {
      authBloc.close();
    });

    test('initial state is AuthInitial', () {
      expect(authBloc.state, const AuthInitial(null));
    });

    blocTest<AuthBloc, AuthState>(
      'emits [AuthLoading, AuthUserRetrieved] when AuthRegisterUserEvent is added and succeeds',
      setUp: () =>
          when(() => mockAgentRepository.registerNewAgent(any(), any()))
              .thenAnswer((_) async => mockAgent),
      build: () => authBloc,
      act: (bloc) => bloc.add(const AuthRegisterUserEvent('user_call_sign')),
      expect: () => [const AuthLoading(), AuthUserRetrieved(mockAgent)],
    );

    blocTest<AuthBloc, AuthState>(
      'emits [AuthLoading, AuthFailure] when AuthRegisterUserEvent is added and fails',
      setUp: () {
        when(() {
          return mockAgentRepository.registerNewAgent(any(), any());
        }).thenThrow(Exception('Failed to register user'));
      },
      build: () => authBloc,
      act: (bloc) => bloc.add(const AuthRegisterUserEvent('username')),
      expect: () =>
          [const AuthLoading(), const AuthFailure('Failed to register user')],
    );
    //
    //   blocTest<AuthBloc, AuthState>(
    //     'emits [AuthLoading, AuthFailure] when AuthRegisterUserEvent is added and fails',
    //     build: () {
    //       when(() => mockAuthRepository.registerUser(any()))
    //           .thenThrow(Exception('Failed to register user'));
    //       return authBloc;
    //     },
    //     act: (bloc) => bloc.add(AuthRegisterUserEvent('username')),
    //     expect: () => [AuthLoading(), AuthFailure()],
    //   );
  });
}
