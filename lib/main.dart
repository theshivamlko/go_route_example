import 'package:flutter/material.dart';
import 'package:go_route_example/GoRouter.dart';
import 'package:go_route_example/MyHomePage.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: goRouter,
      //  home: MyHomePage(),
    );
  }
}
