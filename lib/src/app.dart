import 'package:flutter/material.dart';
import 'screens/home.dart';

class App extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Screen Fill",
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: PreHome(),
    );
  }
}

class PreHome extends StatelessWidget {
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Home(
      width: width,
      height: height,
    );
  }
}
