import 'package:flutter/material.dart';

class TestingBloCApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Testing BloC Pattern",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),home: BloCApp(),
    );
    //Scaffold(appBar: AppBar(title: Text("Testing BloC Pattern")));
  }
}

class BloCApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Testing BloC"),),);
  }

}
