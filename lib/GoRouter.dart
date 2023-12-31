import 'package:flutter/material.dart';
import 'package:go_route_example/ErrorPage.dart';
import 'package:go_route_example/Login.dart';
import 'package:go_route_example/MyHomePage.dart';
import 'package:go_route_example/Page2.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Page3.dart';
import 'Page4.dart';

GlobalKey<NavigatorState> navigatorKey =
    GlobalKey<NavigatorState>(debugLabel: "root");
GlobalKey<NavigatorState> shellKey =
    GlobalKey<NavigatorState>(debugLabel: "shell");

final GoRouter goRouter = GoRouter(
  //  initialLocation: "/page2",
  navigatorKey: navigatorKey,
  redirect: (context, state) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    print("redirect ${state.fullPath}");
    await Future.delayed(const Duration(seconds: 1));
    String email = sharedPreferences.getString("email") ?? "";
    if (email.isNotEmpty && !email.contains("@")) {
      return "/errorPage";
    } else if (email.isEmpty) {
      return "/login";
    }
    return state.path;
  },
  errorBuilder: (context, state) {
    return ErrorPage(
      errorText: 'Page Not Found',
    );
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
              print("builder Page4-2 PATH ${state.fullPath}");
              return Page4();
            },
            pageBuilder: (context, state) {
              print("pageBuilder Page4-2 PATH ${state.fullPath}");
              return CustomTransitionPage(
                transitionDuration: Duration(seconds: 4),
                key: state.pageKey,
                child: Page4(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return FadeTransition(
                    opacity:
                        CurveTween(curve: Curves.bounceIn).animate(animation),
                    child: child,
                  );
                },
              );
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
    ),
    GoRoute(
      name: RoutesName.pageError,
      path: "/errorPage",
      builder: (context, state) {
        print("ErrorPage PATH ${state.fullPath} ${state.pathParameters}");
        return ErrorPage(errorText: '');
      },
    ),
    ShellRoute(
        navigatorKey: shellKey,
        builder: (context, state, child) {
          print("Page2 ShellRoute ${state.fullPath} ${child}");
          return Page2(
            pathParam: "shell Navigator",
            child: child,
          );
        },
        routes: [
          GoRoute(
            name: RoutesName.bottomNavPage1,
            path: "/page6/:value",
            pageBuilder: (context, state) {
              print("Page3 ShellRoute bottomNavPage1 ${state.fullPath} ${state.pathParameters}");
              return NoTransitionPage(
                child: Page3(
                  text: state.pathParameters["value"] ?? "",
                ),
              );
            },
          ),
          GoRoute(
            name: RoutesName.bottomNavPage2,
            path: "/page7/:value",
            pageBuilder: (context, state) {
              print("Page3 ShellRoute bottomNavPage2 ${state.fullPath} ${state.pathParameters}");
              return NoTransitionPage(
                child: Page3(
                  text: state.pathParameters["value"] ?? "",
                ),
              );
            },
          ),
          GoRoute(
            name: RoutesName.bottomNavPage3,
            path: "/page8/:value",
            pageBuilder: (context, state) {
              print("Page3 ShellRoute bottomNavPage3 ${state.fullPath} ${state.pathParameters}");
              return NoTransitionPage(
                child: Page3(
                  text: state.pathParameters["value"] ?? "",
                ),
              );
            },
          ),
        ])
  ],
);

class RoutesName {
  static const home = "home";
  static const page2 = "page2";
  static const page3 = "page3";
  static const page4 = "page4";
  static const page4_2 = "page4_2";
  static const pageLogin = "login";
  static const pageError = "errorPage";

  static const bottomNavPage1 = "bottomNavPage1";
  static const bottomNavPage2 = "bottomNavPage2";
  static const bottomNavPage3 = "bottomNavPage3";

}

TextStyle textStyle = TextStyle(fontSize: 16);
