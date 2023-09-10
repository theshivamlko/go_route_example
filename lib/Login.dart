import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'GoRouter.dart';

class Login extends StatefulWidget {
  final String pathParam;
  String? queryParam1;

  Login({required this.pathParam, this.queryParam1, super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String text = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Login"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Login Screen  ',
              style: textStyle,
            ),
            Padding(padding: EdgeInsets.all(10)),
            TextField(
              onChanged: (s) {
                text = s;
              },
            ),
            ElevatedButton(
                onPressed: () async {
                  SharedPreferences sharedPreferences =
                      await SharedPreferences.getInstance();
                  sharedPreferences.setString("email", text);
                },
                child: Text("Login")),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
