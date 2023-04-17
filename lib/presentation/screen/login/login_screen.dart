import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shoes_mall/presentation/screen/login/bloc/login_bloc.dart';
import 'package:shoes_mall/presentation/screen/login/bloc/login_event.dart';
import 'package:shoes_mall/presentation/screen/login/bloc/login_state.dart';
import 'package:shoes_mall/presentation/screen/main/main_screen.dart';

class LoginScreen extends StatelessWidget {
  static String get routePath => '/login';

  static String get routeName => 'login_screen';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LoginBloc, LoginState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    context.read<LoginBloc>().add(OnLoginEvent());
                  },
                  child: const Text("LOGIN"),
                ),
              ),
            ],
          );
        },
        listener: (context, state) {
          if (state.isCertified) {
            context.pushNamed(MainScreen.routeName);
          }
        },
      ),
    );
  }
}
