import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shoes_mall/common/const/colors.dart';
import 'package:shoes_mall/data/repository/repository.dart';
import 'package:shoes_mall/presentation/screen/detail/detail_screen.dart';
import 'package:shoes_mall/presentation/screen/login/bloc/login_bloc.dart';
import 'package:shoes_mall/presentation/screen/login/login_screen.dart';
import 'package:shoes_mall/presentation/screen/main/main_screen.dart';
import 'package:shoes_mall/presentation/screen/splash/bloc/splash_bloc.dart';
import 'package:shoes_mall/presentation/screen/splash/splash_screen.dart';

import 'domain/model/product_data.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  GoRouter get _router => GoRouter(
    initialLocation: SplashScreen.routePath,
    routes: [
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
    ],
  );


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return RepositoryProvider(
      create: (context) {
        return repository();
      },
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            lazy: true,
            create: (BuildContext context) {
              final repository = context.read<Repository>();
              return SplashBloc(repository);
            },
          ),
          BlocProvider(
            lazy: true,
            create: (BuildContext context) {
              final repository = context.read<Repository>();
              return LoginBloc(repository);
            },
          ),
          // BlocProvider(
          //   lazy: true,
          //   create: (BuildContext context) {
          //     final repository = context.read<Repository>();
          //     return HomeBloc(repository);
          //   },
          // ),
        ],
        child: MaterialApp.router(
          title: 'Shoes Mall',
          theme: ThemeData(
            fontFamily: 'Gilroy',
            appBarTheme: const AppBarTheme(
              backgroundColor: kBodyColor,
              elevation: 0,
              foregroundColor: kTextColor,
              iconTheme: IconThemeData(
                color: kTextLightColor,
              ),
            ),
          ),
          debugShowCheckedModeBanner: false,
          routerConfig: _router,
        ),
      ),
    );
  }
}
