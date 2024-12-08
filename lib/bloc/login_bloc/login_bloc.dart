import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_repository/user_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository _userRepository;

  LoginBloc(this._userRepository) : super(LoginInitial()) {
    on<LoginRequested>((event, emit) async {
      emit(LoginLoading());
      try {
        await _userRepository.signIn(event.email, event.password);
        emit(LoginSuccess());
      } catch (e) {
        emit(LoginFailure());
      }
    });
  }
}
