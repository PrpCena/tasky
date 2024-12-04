part of 'signup_bloc.dart';

sealed class SignupState extends Equatable {}

class SignupInitial extends SignupState {
  @override
  List<Object?> get props => [];
}

class SignupSuccess extends SignupState {
  @override
  List<Object?> get props => [];
}

class SignupFailure extends SignupState {
  @override
  List<Object?> get props => [];
}

class SignupLoading extends SignupState {
  @override
  List<Object?> get props => [];
}
