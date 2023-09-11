import 'package:flutter/material.dart';
import 'package:go_route_example/BottomNav.dart';

import 'GoRouter.dart';

class Page2 extends StatefulWidget {
  final String pathParam;
  String? queryParam1;
  Widget? child;

  Page2({required this.pathParam, this.queryParam1, this.child, super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  void _incrementCounter() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Page 2"),
      ),

      bottomNavigationBar: BottomNav(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'Page2  ',
            style: textStyle,
          ),
          Padding(padding: EdgeInsets.all(10)),
          Text(
            'Path = ${widget.pathParam}',
            style: textStyle,
          ),
          Padding(padding: EdgeInsets.all(10)),
          Text(
            'Query = ${widget.queryParam1}',
            style: textStyle,
          ),
          Container(
              height: 300,
              child: widget.child ?? Center())
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
