import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:tasky/bloc/login_bloc/login_bloc.dart';
import 'package:tasky/bloc/signup_bloc/signup_bloc.dart';
import 'package:tasky/screens/login_screen.dart';
import 'package:tasky/screens/signup_screen.dart';
import 'package:tasky/screens/task_screen.dart';
import 'package:user_repository/user_repository.dart';

import 'cubit/task_cubit.dart';

class MyApp extends StatelessWidget {
  final UserRepository userRepository;

  const MyApp({super.key, required this.userRepository});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TaskCubit>(
          create: (context) => TaskCubit(),
        ),
        BlocProvider<AuthenticationBloc>(
          create: (context) =>
              AuthenticationBloc(userRepository: userRepository),
        ),
        BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(userRepository),
        ),
        BlocProvider<SignupBloc>(
          create: (context) => SignupBloc(userRepository),
        ),
      ],
      child: MaterialApp(
        routes: {
          TaskScreen.id: (context) => TaskScreen(),
          LoginScreen.id: (context) => LoginScreen(),
          SignUpScreen.id: (context) => SignUpScreen()
        },
        home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
            if (state == Authenticated) {
              return TaskScreen();
            } else {
              return LoginScreen();
            }
          },
        ),
      ),
    );
  }
}
