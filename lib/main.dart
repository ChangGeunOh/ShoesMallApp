import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoes_mall/common/const/colors.dart';
import 'package:shoes_mall/common/router/go_router.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(goRouterProvider);

    return MaterialApp.router(
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
      routerConfig: router,
    );
  }
}
