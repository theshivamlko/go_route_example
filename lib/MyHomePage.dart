import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'GoRouter.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
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
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ElevatedButton(
                onPressed: () {
                  String text="Shivam";
                  GoRouter.of(context).push("/page2/$text");
                  //    context.go("/page2");
                },
                child: Text("Open Page2")),
            ElevatedButton(
                onPressed: () {
                  GoRouter.of(context).push("/page3");
                  //    context.go("/page2");
                },
                child: Text("Open Page3")),
            ElevatedButton(
                onPressed: () {
                  GoRouter.of(context).push("/page3/page4");
                  //    context.go("/page2");
                },
                child: Text("Open Page4")),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
