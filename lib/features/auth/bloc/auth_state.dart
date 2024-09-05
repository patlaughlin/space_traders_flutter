part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();
}

final class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}

final class AuthUserRetrieved extends AuthState {
  final String userJwt;

  const AuthUserRetrieved(this.userJwt);

  @override
  List<Object?> get props => [userJwt];
}
