import 'package:cross_promote/cross_promote.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final iosUrl =
        "https://apps.apple.com/us/developer/edward-prokopik/id1077587110";

    return Scaffold(
      body: SafeArea(
        child: CrossPromote(
          iosUrl: iosUrl,
        ),
      ),
    );
  }
}
