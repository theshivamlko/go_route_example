import 'package:flutter/material.dart';

import 'GoRouter.dart';

class Page3 extends StatefulWidget {
  final String text;

  Page3({
    required this.text,
  }) : super();

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("Page3 initState");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Page 3"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'Page 3 ',
            style: textStyle,
          ),
          Text(
            '${widget.text}',
            style: textStyle,
          ),
        ],
      ),
    );
  }
}
