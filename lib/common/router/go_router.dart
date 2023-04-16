import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shoes_mall/domain/model/product_data.dart';
import 'package:shoes_mall/domain/model/user_data.dart';
import 'package:shoes_mall/presentation/screen/detail/detail_screen.dart';
import 'package:shoes_mall/presentation/screen/login/login_screen.dart';
import 'package:shoes_mall/presentation/screen/main/main_screen.dart';
import 'package:shoes_mall/presentation/screen/splash/splash_screen.dart';

import 'auth_data.dart';

part 'go_router.g.dart';

@Riverpod(keepAlive: true)
GoRouter goRouter(GoRouterRef ref) {
  final routeNotifier = RouteNotifier(ref: ref);

  return GoRouter(
    routes: routeNotifier.routes,
    initialLocation: SplashScreen.routePath,
    refreshListenable: routeNotifier,
    redirect: (_, state) => routeNotifier.redirect(state),
  );
}

class RouteNotifier extends ChangeNotifier {
  final Ref ref;

  RouteNotifier({
    required this.ref,
  }) {
    ref.listen<UserDataBase>(authDataProvider, (previous, next) {
      if (previous != next) {
        notifyListeners();
      }
    });
  }

  // String getClassType(LoginDataBase? loginDataBase) {
  //   if (loginDataBase == null) return 'null';
  //   return loginDataBase is LoginDataLoading
  //       ? 'loading'
  //       : loginDataBase is LoginDataError
  //       ? 'error'
  //       : 'base';
  // }

  List<GoRoute> get routes => [
        GoRoute(
          path: SplashScreen.routePath,
          name: SplashScreen.routeName,
          builder: (_, __) => const SplashScreen(),
        ),
        GoRoute(
          path: LoginScreen.routePath,
          name: LoginScreen.routeName,
          pageBuilder: (_, stat) {
            return const MaterialPage(
              child: LoginScreen(),
            );
          },
        ),
        GoRoute(
          path: DetailScreen.routePath,
          name: DetailScreen.routeName,
          pageBuilder: (_, stat) {
            final productData = stat.extra as ProductData;
            return MaterialPage(
              child: DetailScreen(
                productData: productData,
              ),
            );
          },
        ),
        GoRoute(
          path: MainScreen.routePath,
          name: MainScreen.routeName,
          builder: (_, __) => const MainScreen(),
        ),
      ];

  String? redirect(GoRouterState state) {
    String? redirect;
    final userData = ref.read(authDataProvider);
    print('redirect>${userData.toString()}');
    print('redirect>${state.location}');
    if (userData is UserDataError && state.location != LoginScreen.routePath) {
      redirect = LoginScreen.routePath;
    }
    if (userData is UserData &&
        userData.id > 0 &&
        state.location == LoginScreen.routePath) {
      redirect = MainScreen.routePath;
    }
    print('location redirect>$redirect');
    return redirect;
  }
}
