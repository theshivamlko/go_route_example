import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'GoRouter.dart';

class ErrorPage extends StatefulWidget {
  final String errorText;

  ErrorPage({required this.errorText, super.key});

  @override
  State<ErrorPage> createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Error Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.cancel,
              color: Colors.red,
              size: 150,
            ),
            Text(
              'Error \n ${widget.errorText}',
              style: TextStyle(fontSize: 25),
              textAlign: TextAlign.center,
            ),
            ElevatedButton(onPressed: () async {}, child: Text("REFRESH")),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
