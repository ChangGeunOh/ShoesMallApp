import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shoes_mall/presentation/screen/login/login_screen.dart';
import 'package:shoes_mall/presentation/screen/splash/bloc/splash_bloc.dart';
import 'package:shoes_mall/presentation/screen/splash/bloc/splash_event.dart';
import 'package:shoes_mall/presentation/screen/splash/bloc/splash_state.dart';

class SplashScreen extends StatelessWidget {
  static String get routePath => '/splash';

  static String get routeName => 'splash';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<SplashBloc>(context).add(SplashCompleted());
    // final viewModel = ref.watch(splashViewModelProvider);
    print("build.....");
    return Scaffold(
      body: BlocListener<SplashBloc, SplashState> (
        listener: (context, state) {
          context.goNamed(LoginScreen.routeName);
        },
          child: Center(
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: const [
                Text(
                  'Shoes Shopping Mall',
                  style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.w700),
                ),
                CircularProgressIndicator(),
              ],
            ),
          ),
      ),
    );
  }
}
