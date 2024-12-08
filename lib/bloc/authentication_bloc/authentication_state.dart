part of 'authentication_bloc.dart';

sealed class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object?> get props => [];
}

class Authenticated extends AuthenticationState {
  final MyUser? myUser;

  const Authenticated(this.myUser);

  @override
  List<Object?> get props => [myUser];
}

class Unauthenticated extends AuthenticationState {
  const Unauthenticated();
}

class Unknown extends AuthenticationState {
  const Unknown();
}
