import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:user_repository/user_repository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository userRepository;
  late final StreamSubscription<MyUser?> _userSubscription;

  AuthenticationBloc({required this.userRepository}) : super(const Unknown()) {
    _userSubscription = userRepository.user.listen((user) {
      add(AuthenticationUserChanged(user));
    });

    on<AuthenticationUserChanged>((event, emit) {
      if (event.user != MyUser.empty) {
        emit(Authenticated(event.user));
      } else {
        emit(Unauthenticated());
      }
    });

    on<AuthenticationUserLogout>((event, emit) {
      userRepository.logOut();
      emit(Unauthenticated());
    });
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}
