import 'package:flutter/material.dart';
import 'package:go_route_example/GoRouter.dart';
import 'package:go_router/go_router.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(currentIndex: _currentIndex, onTap: (value) => _onTap(value), items: [
      BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: Colors.grey,
          ),
          activeIcon: Icon(
            Icons.home,
            color: Colors.green,
          ),
          label: "Home"),
      BottomNavigationBarItem(
          icon: Icon(
            Icons.account_circle,
            color: Colors.grey,
          ),
          activeIcon: Icon(
            Icons.account_circle,
            color: Colors.green,
          ),
          label: "Profile"),
      BottomNavigationBarItem(
          icon: Icon(
            Icons.settings,
            color: Colors.grey,
          ),
          activeIcon: Icon(
            Icons.settings,
            color: Colors.green,
          ),
          label: "Settings"),
    ]);
  }

  void _onTap(int index) {
    print(index);
    switch (index) {
      case 0:
        context.goNamed(RoutesName.bottomNavPage1, pathParameters: {"value": "Home"});
        break;
      case 1:
        context.goNamed(RoutesName.bottomNavPage1, pathParameters: {"value": "Profile"});
        break;
      case 2:
        context.goNamed(RoutesName.bottomNavPage1, pathParameters: {"value": "Settings"});
        break;
    }
    setState(() {});
  }
}
