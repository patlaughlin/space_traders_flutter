import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:space_traders/agent_repository.dart';
import 'package:space_traders/features/auth/bloc/auth_bloc.dart';
import 'package:space_traders/service_locator.dart';

class MockAuthRepository extends Mock implements AgentRepository {}

void main() {
  group('AuthBloc', () {
    late AuthBloc authBloc;
    late MockAuthRepository mockAuthRepository;

    setUp(() {
      mockAuthRepository = MockAuthRepository();
      if (getIt.isRegistered<AgentRepository>()) {
        getIt.unregister<AgentRepository>();
      }
      getIt.registerLazySingleton<AgentRepository>(() => MockAuthRepository());
      authBloc = AuthBloc();
    });

    tearDown(() {
      authBloc.close();
    });

    test('initial state is AuthInitial', () {
      expect(authBloc.state, AuthInitial());
    });

    blocTest<AuthBloc, AuthState>(
      'emits [AuthLoading, AuthUserRetrieved] when AuthRegisterUserEvent is added and succeeds',
      build: () {
        when(() => mockAuthRepository.registerNewAgent(any()))
            .thenAnswer((_) async => 'user_jwt');
        return authBloc;
      },
      act: (bloc) => bloc.add(const AuthRegisterUserEvent('user_call_sign')),
      expect: () => [AuthLoadingEvent(), const AuthUserRetrieved('user_jwt')],
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
