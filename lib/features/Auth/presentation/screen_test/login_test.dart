import 'package:blog_app/features/Auth/presentation/cubit/login_cubit.dart';
import 'package:blog_app/features/Auth/presentation/screen_test/home_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginTest extends StatelessWidget {
  const LoginTest({super.key});

  @override
  Widget build(BuildContext context) {
    final usernameController = TextEditingController();
    final passwordController = TextEditingController();
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text("Bienvenu sur Facebook"),backgroundColor: Colors.green,));
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => const HomeTest()),
              );
            } else if (state is LoginFailure) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text("Un erreur lors de login"),backgroundColor: Colors.red,));
            }
        },
        builder: (context, state) {
          return BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              return Scaffold(
                appBar: AppBar(title: Center(child: Text("Login"))),
                body: Column(
                  children: [
                    SizedBox(height: 40),
                    TextField(
                      controller: usernameController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: "Username",
                        border: const OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 40),
                    TextField(
                      controller: passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        labelText: "Password",
                        border: const OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 40),
                    ElevatedButton(
                      onPressed: () {
                        final username = usernameController.text.trim();
                        final password = passwordController.text.trim();

                        context.read<LoginCubit>().eitherErrorOrSuccess(
                          username,
                          password,
                        );
                      },
                      child: Text("Login"),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
