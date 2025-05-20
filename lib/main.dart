import 'package:blog_app/features/Auth/presentation/cubit/login_cubit.dart';
import 'package:blog_app/features/Auth/presentation/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'utils/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        textTheme: Theme.of(
          context,
        ).textTheme.apply(bodyColor: kPrimaryColor, fontFamily: 'Montserrat'),
      ),
      home: BlocProvider(
        create: (context) => LoginCubit(),
        child: const LoginScreen(),
      ),
    );
  }
}
