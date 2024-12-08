import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:user_repository/user_repository.dart';

import 'my_app_view.dart';

class MyApp extends StatelessWidget {
  final FirebaseUserRepo userRepository;

  const MyApp({super.key, required this.userRepository});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (_) => AuthenticationBloc(userRepository: userRepository),
      child: const MyAppView(),
    );
  }
}
