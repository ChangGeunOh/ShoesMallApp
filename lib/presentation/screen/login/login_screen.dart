import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoes_mall/presentation/screen/login/view_model/login_view_model.dart';

class LoginScreen extends ConsumerWidget {
  static String get routePath => '/login';

  static String get routeName => 'login_screen';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(loginViewModelProvider);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ElevatedButton(
              onPressed: () {
                ref.read(loginViewModelProvider.notifier).login(userid: 'kminchelle', passwd: '0lelplR');
              },
              child: const Text("LOGIN"),
            ),
          ),
        ],
      ),
    );
  }
}
