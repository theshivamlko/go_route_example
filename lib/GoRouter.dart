

import 'package:go_route_example/MyHomePage.dart';
import 'package:go_router/go_router.dart';

final GoRouter goRouter=GoRouter(routes: [

  GoRoute(path: "/",builder: (context, state) {
    return MyHomePage();
  },),

  GoRoute(path: "/page2",builder: (context, state) {
    return MyHomePage();
  },),


]);