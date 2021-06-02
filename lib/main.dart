
import 'package:covid19/HomePage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: HomeView(),theme: ThemeData(fontFamily: 'OpenSans',primaryColor:Colors.indigo[900],
  textTheme:TextTheme(subtitle:TextStyle(fontWeight:FontWeight.bold)), ),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

