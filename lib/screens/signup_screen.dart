import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/screens/task_screen.dart';
import 'package:user_repository/user_repository.dart';
import '../bloc/signup_bloc/signup_bloc.dart';
import '../components/generic_button.dart';
import '../components/text_input.dart';
import '../themes/colors.dart';

class SignUpScreen extends StatelessWidget {
  static const String id = 'signup_screen';

  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String email = '';
    String password = '';
    String name = '';

    return Scaffold(
      backgroundColor: AppColors.background,
      body: BlocListener<SignupBloc, SignupState>(
        listener: (context, state) {
          if (state is SignupSuccess) {
            Navigator.pushNamed(context, TaskScreen.id);
          } else if (state is SignupFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Invalid credentials. Please try again.')),
            );
          }
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextInput(
                prefixIcon: Icons.abc_outlined,
                label: 'Name',
                inputType: TextInputType.name,
                onChanged: (value) => name = value,
              ),
              SizedBox(
                height: 10,
              ),
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
              BlocBuilder<SignupBloc, SignupState>(
                builder: (context, state) {
                  if (state is SignupLoading) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return GenericButton(
                    label: 'Create Account',
                    onPressed: () {
                      MyUser myUser = MyUser.empty;
                      myUser.email = email;
                      myUser.name = name;
                      context.read<SignupBloc>().add(
                          SignupRequested(user: myUser, password: password));
                      Navigator.pushNamed(context, TaskScreen.id);
                    },
                  );
                },
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Text(
                      'Already Have An Account?',
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
    );
  }
}
