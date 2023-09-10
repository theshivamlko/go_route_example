import 'package:flutter/material.dart';
import 'package:go_route_example/MyHomePage.dart';
import 'package:go_route_example/Page2.dart';
import 'package:go_router/go_router.dart';

import 'Page3.dart';
import 'Page4.dart';

final GoRouter goRouter = GoRouter(
    //  initialLocation: "/page2",
    routes: [
      GoRoute(
          path: "/",
          builder: (context, state) {
            return MyHomePage();
          },
          // nested path
          routes: [
            GoRoute(
              path: "page2/:name",
              builder: (context, state) {
                return Page2(text: state.pathParameters["name"]!);
              },
            ),
          ]),
      GoRoute(
          path: "/page3",
          builder: (context, state) {
            return Page3();
          },
          // nested path
          routes: [
            GoRoute(
              path: "page4",
              builder: (context, state) {
                return Page4();
              },
            ),
          ]),
    ]);

TextStyle textStyle = TextStyle(fontSize: 20);
