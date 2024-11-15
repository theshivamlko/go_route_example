import 'package:flutter/material.dart';
import 'package:go_route_example/GoRouter.dart';
import 'package:go_router/go_router.dart';

class NestedNavigation extends StatefulWidget {
  const NestedNavigation({super.key});

  @override
  State<NestedNavigation> createState() => _NestedNavigationState();
}

class _NestedNavigationState extends State<NestedNavigation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NestedNavigation"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("NestedNavigation Page"),
            ElevatedButton(
                onPressed: () {
                  context.go("${RoutesName.nestedPage}/${RoutesName.nestedPage1}");
                },
                child: Text("Replace Fragment 1"))
          ],
        ),
      ),
    );
  }
}
