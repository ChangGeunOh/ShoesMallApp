import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoes_mall/presentation/screen/splash/view_model/splash_view_model.dart';

class SplashScreen extends ConsumerWidget {
  static String get routePath => '/splash';

  static String get routeName => 'splash';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(splashViewModelProvider);
    return Scaffold(
      body: Center(
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
    );
  }
}
