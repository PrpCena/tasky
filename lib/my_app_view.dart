import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_repository/task_repository.dart';
import 'package:tasky/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:tasky/bloc/task_bloc/task_bloc.dart';
import 'package:tasky/screens/login_screen.dart';
import 'package:tasky/screens/signup_screen.dart';
import 'package:tasky/screens/task_screen.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthenticationBloc(
          userRepository: context.read<AuthenticationBloc>().userRepository),
      child: MaterialApp(
        title: 'Task Management App',
        debugShowCheckedModeBanner: false,
        routes: {
          LoginScreen.id: (context) => LoginScreen(),
          SignUpScreen.id: (context) => SignUpScreen(),
        },
        home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
            if (state is Authenticated) {
              return BlocProvider(
                create: (context) => TaskBloc(
                  FirebaseTaskRepo(uid: state.myUser!.uid),
                ),
                child: TaskScreen(userName: state.myUser!.name),
              );
            } else {
              return LoginScreen();
            }
          },
        ),
      ),
    );
  }
}
