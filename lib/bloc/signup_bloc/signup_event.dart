part of 'signup_bloc.dart';

sealed class SignupEvent extends Equatable {}

class SignupRequested extends SignupEvent {
  final MyUser user;
  final String password;

  SignupRequested({required this.user, required this.password});

  @override
  List<Object?> get props => [user, password];
}
