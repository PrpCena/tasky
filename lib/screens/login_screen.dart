import 'package:flutter/material.dart';
import 'package:tasky/components/generic_button.dart';
import 'package:tasky/screens/signup_screen.dart';
import 'package:tasky/themes/colors.dart';
import '../components/text_input.dart';

class LoginScreen extends StatelessWidget {
  static const String id = 'login_screen';

  @override
  Widget build(BuildContext context) {
    String email = '';
    String password = '';

    return Scaffold(
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
            GenericButton(
              label: 'Log in',
              onPressed: () => {},
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, SignUpScreen.id),
                  child: Text(
                    'Do Not Have An Account?',
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
