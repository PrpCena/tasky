import 'package:flutter/material.dart';
import 'package:tasky/screens/login_screen.dart';

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
      body: Container(
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
            GenericButton(
              label: 'Create Account',
              onPressed: () => {},
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
                        color: Colors.blueAccent, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
