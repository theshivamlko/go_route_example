import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'GoRouter.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String email = "";



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp)async {
      SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
      email= sharedPreferences.getString("email")??"";
      setState(() {

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Page 1"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Page1 ',
              style: textStyle,
            ),
            Text(
              'Email: $email',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ElevatedButton(
                onPressed: () {
                  String text = "Page1 Path param";
                  GoRouter.of(context).push("/page2/$text");
                },
                child: Text("Open Page2 Path Param")),
            ElevatedButton(
                onPressed: () {
                  GoRouter.of(context).pushNamed(RoutesName.page2,
                      pathParameters: {"name": "Page1 Named Param"});
                  //     context.go("/page2");
                },
                child: Text("Open Page2 Named Param")),
            ElevatedButton(
                onPressed: () {
                  GoRouter.of(context).push("/page3/${"Page1 Goparam"}");
                  //  context.go("/page3/${"Page1 Goparam"}");
                },
                child: Text("Open Page3 Path Param")),
            ElevatedButton(
                onPressed: () {
                  context.goNamed(RoutesName.page4_2,
                      pathParameters: {"value": "Page1 NamedParam"});
                  //  GoRouter.of(context).pushNamed(RoutesName.page4_2,pathParameters: {"value":"Page1 NamedParam"});
                },
                child: Text("Open Page4 Named Param")),
            ElevatedButton(
                onPressed: () {
                  String text = "Page2 Path & Query param";
                  GoRouter.of(context).pushNamed(RoutesName.page2,
                      pathParameters: {"name": text},
                      queryParameters: {"value1": "QueryValue1"});
                },
                child: Text("Open Page2 Path & Query param")),
          ],
        ),
      ),
    );
  }
}
