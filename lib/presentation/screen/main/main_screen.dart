import 'package:flutter/material.dart';
import 'package:shoes_mall/common/const/colors.dart';
import 'package:shoes_mall/presentation/screen/cart/cart_screen.dart';
import 'package:shoes_mall/presentation/screen/home/home_screen.dart';
import 'package:flutter_svg/svg.dart';

class MainScreen extends StatefulWidget {
  static String get routePath => '/main';

  static String get routeName => 'main';

  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  int index = 0;

  void tabListener() {
    setState(() {
      index = _controller.index;
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = TabController(
      length: 4,
      vsync: this,
      animationDuration: const Duration(milliseconds: 0),
    );
    _controller.addListener(tabListener);
  }

  @override
  void dispose() {
    _controller.removeListener(tabListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (index) {
          _controller.animateTo(index);
        },
        type: BottomNavigationBarType.fixed,
        iconSize: 28,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.black,
        currentIndex: index,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/home_icon.svg",
              colorFilter: ColorFilter.mode(index == 0 ? kActiveColor : kDeActiveColor, BlendMode.srcIn),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/heart_icon.svg",
              colorFilter: ColorFilter.mode(index == 1 ? kActiveColor : kDeActiveColor, BlendMode.srcIn),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/cart_icon.svg",
              colorFilter: ColorFilter.mode(index == 2 ? kActiveColor : kDeActiveColor, BlendMode.srcIn),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/profile_icon.svg",
              colorFilter: ColorFilter.mode(index == 3 ? kActiveColor : kDeActiveColor, BlendMode.srcIn),
            ),
            label: '',
          ),
        ],
      ),
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _controller,
        children: [
          HomeScreen(),
          HomeScreen(),
          CartScreen(),
          HomeScreen(),
        ],
      ),
    );
  }
}
