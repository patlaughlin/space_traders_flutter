import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_traders/models/models.dart';
import 'package:space_traders/service_locator.dart';

import '../../../agent_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  late final AgentRepository _agentRepository;

  AuthBloc() : super(const AuthInitial(null)) {
    _agentRepository = getIt.get<AgentRepository>();

    on<AuthRegisterUserEvent>(_registerUser);
  }

  void _registerUser(
      AuthRegisterUserEvent event, Emitter<AuthState> emit) async {
    emit(const AuthLoading());
    try {
      final Agent userAgent = await _agentRepository.registerNewAgent(
          event.callSign, event.callSign);
      emit(AuthUserRetrieved(userAgent));
    } catch (e) {
      emit(const AuthFailure('Failed to register user'));
    }
  }
}
