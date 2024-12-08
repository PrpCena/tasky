import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/bloc/login_bloc/login_bloc.dart';
import 'package:tasky/components/generic_button.dart';
import 'package:tasky/screens/signup_screen.dart';
import 'package:tasky/themes/colors.dart';
import '../bloc/authentication_bloc/authentication_bloc.dart';
import '../components/text_input.dart';

class LoginScreen extends StatelessWidget {
  static const String id = 'login_screen';
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String email = '';
    String password = '';

    return BlocProvider<LoginBloc>(
      create: (context) =>
          LoginBloc(context.read<AuthenticationBloc>().userRepository),
      child: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          switch (state) {
            case LoginInitial():
              break;
            case LoginSuccess():
              break;
            case LoginFailure():
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: Text('Invalid credentials. Please try again.')),
              );
              break;
            case LoginLoading():
              break;
          }
        },
        child: Scaffold(
          backgroundColor: AppColors.background,
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextInput(
                  prefixIcon: Icons.email_outlined,
                  label: 'Email',
                  inputType: TextInputType.emailAddress,
                  onChanged: (value) => email = value,
                ),
                SizedBox(
                  height: 10,
                ),
                TextInput(
                  prefixIcon: Icons.password_outlined,
                  label: 'Password',
                  isPassword: true,
                  onChanged: (value) => password = value,
                ),
                SizedBox(
                  height: 10,
                ),
                BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    if (state is LoginLoading) {
                      return Center(child: CircularProgressIndicator());
                    }
                    return GenericButton(
                        label: 'Log in',
                        onPressed: () {
                          context.read<LoginBloc>().add(
                                LoginRequested(
                                    email: email, password: password),
                              );
                        });
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () =>
                          Navigator.pushNamed(context, SignUpScreen.id),
                      child: Text(
                        'Do Not Have An Account?',
                        style: TextStyle(
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
