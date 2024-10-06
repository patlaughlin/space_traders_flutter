part of 'auth_bloc.dart';

final class AuthInitial extends AuthState {
  const AuthInitial(super.userAgent);

  @override
  List<Object> get props => [];
}

abstract class AuthState extends Equatable {
  final Agent? userAgent;

  const AuthState(this.userAgent);
}

final class AuthUserRetrieved extends AuthState {
  final Agent agent;

  const AuthUserRetrieved(this.agent) : super(null);

  @override
  List<Object?> get props => [agent];
}

final class AuthLoading extends AuthState {
  const AuthLoading() : super(null);

  @override
  List<Object> get props => [];
}

final class AuthFailure extends AuthState {
  final String error;

  const AuthFailure(this.error) : super(null);

  @override
  List<Object> get props => [];
}
