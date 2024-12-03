import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/cubit/task_cubit.dart';
import 'package:tasky/screens/login_screen.dart';
import 'package:tasky/screens/signup_screen.dart';
import 'screens/task_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const taskScreen = '/task_screen';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskCubit(),
      child: MaterialApp(
        routes: {
          TaskScreen.id: (context) => TaskScreen(),
          LoginScreen.id: (context) => LoginScreen(),
          SignUpScreen.id: (context) => SignUpScreen()
        },
        home: LoginScreen(),
      ),
    );
  }
}
