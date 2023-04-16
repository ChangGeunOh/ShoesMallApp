import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shoes_mall/common/router/go_router.dart';
import 'package:shoes_mall/presentation/screen/login/login_screen.dart';

part 'splash_view_model.g.dart';

@riverpod
class SplashViewModel extends _$SplashViewModel {
  late GoRouter _goRouter;

  @override
  SplashViewModel? build() {
    _goRouter = ref.watch(goRouterProvider);
    init();
    return null;
  }

  Future<void> init() async {
    await Future.delayed(const Duration(milliseconds: 2000));
    _goRouter.goNamed(LoginScreen.routeName);
  }
}
