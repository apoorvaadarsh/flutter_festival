import 'package:flutter/material.dart';

class AddScreen extends StatefulWidget {
  static const routeName = '/add-screen';
  const AddScreen({Key? key}) : super(key: key);

  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Screen'),
      ),
      body: Center(
        child: Text('Add Screen'),
      ),
    );
  }
}
