import 'package:flutter/material.dart';

class NestedPage1 extends StatefulWidget {
  const NestedPage1({super.key});

  @override
  State<NestedPage1> createState() => _NestedPage1State();
}

class _NestedPage1State extends State<NestedPage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nested 1"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Text("Nested Page 1"),
        ]),
      ),
    );
  }
}
