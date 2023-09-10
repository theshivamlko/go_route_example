import 'package:flutter/material.dart';

import 'GoRouter.dart';

class Page2 extends StatefulWidget {
  final String pathParam;
  String? queryParam1;

  Page2({required this.pathParam, this.queryParam1, super.key});

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
