import 'package:flutter/material.dart';
import 'package:go_route_example/Login.dart';
import 'package:go_route_example/MyHomePage.dart';
import 'package:go_route_example/Page2.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Page3.dart';
import 'Page4.dart';

final GoRouter goRouter = GoRouter(
  //  initialLocation: "/page2",
  redirect: (context, state) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await Future.delayed(Duration(seconds: 1));
    if (sharedPreferences.getString("email") != null) {
      return "/";
    }
    return "/login";
  },
  routes: [
    GoRoute(
        name: RoutesName.home,
        path: "/",
        builder: (context, state) {
          print("MyHomePage PATH ${state.fullPath}");

          return MyHomePage();
        },
        // nested path
        routes: [
          GoRoute(
              name: RoutesName.page2,
              path: "page2/:name",
              builder: (context, state) {
                var stateParam = state.uri.queryParameters;

                return Page2(
                  pathParam: state.pathParameters["name"]!,
                  queryParam1: stateParam["value1"],
                );
              },
              routes: [
                GoRoute(
                  name: RoutesName.page4,
                  path: "page4",
                  builder: (context, state) {
                    print("Page4 PATH ${state.fullPath}");
                    return Page4();
                  },
                ),
              ]),
        ]),
    GoRoute(
        name: RoutesName.page3,
        path: "/page3/:value",
        builder: (context, state) {
          print("Page3 PATH ${state.fullPath} ${state.pathParameters}");
          return Page3(
            text: state.pathParameters["value"] ?? "",
          );
        },
        // nested path
        routes: [
          GoRoute(
            name: RoutesName.page4_2,
            path: "page4_2",
            builder: (context, state) {
              print("Page4-2 PATH ${state.fullPath}");
              return Page4();
            },
          ),
        ]),
    GoRoute(
      name: RoutesName.pageLogin,
      path: "/login",
      builder: (context, state) {
        print("Login PATH ${state.fullPath} ${state.pathParameters}");
        return Login(pathParam: '');
      },
    )
  ],
);

class RoutesName {
  static const home = "home";
  static const page2 = "page2";
  static const page3 = "page3";
  static const page4 = "page4";
  static const page4_2 = "page4_2";
  static const pageLogin = "login";
}

TextStyle textStyle = TextStyle(fontSize: 16);
