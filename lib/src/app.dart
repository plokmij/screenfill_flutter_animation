import 'package:flutter/material.dart';
import 'screens/home.dart';

class App extends StatelessWidget{
  Widget build(BuildContext context){
    return MaterialApp(
      title: "Screen Fill",
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Home(),
    );
  }
}