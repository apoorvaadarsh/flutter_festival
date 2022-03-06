import 'package:flutter/material.dart';
import 'package:flutter_festival/models/item.dart';
import 'package:flutter_festival/screens/add_screen.dart';
import 'package:flutter_festival/screens/homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Planner',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
      routes: {
        AddScreen.routeName: (context) => AddScreen(),
      },
    );
  }
}
