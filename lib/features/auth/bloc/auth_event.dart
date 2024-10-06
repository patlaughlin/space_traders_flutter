part of 'auth_bloc.dart';

class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class AuthRegisterUserEvent extends AuthEvent {
  final String callSign;

  const AuthRegisterUserEvent(this.callSign);
}
