part of 'authentication_bloc.dart';

class AuthenticationState extends Equatable {
  const AuthenticationState._({
    this.status = AuthenticationStatus.unknown,
    this.participante,
    this.message,
  });

  const AuthenticationState.unknown() : this._();

  const AuthenticationState.authenticated(Participante participante)
      : this._(
            status: AuthenticationStatus.authenticated,
            participante: participante);

  const AuthenticationState.unauthenticated()
      : this._(status: AuthenticationStatus.unauthenticated);

  final AuthenticationStatus status;
  final Participante participante;
  final String message;

  @override
  List<Object> get props => [status, participante, message];
}
