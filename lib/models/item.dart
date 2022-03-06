import 'package:flutter/material.dart';

class Item {
  String? name = '';
  String? price = '';
  DateTime date = DateTime.now();
  Item({
    @required this.name,
    @required this.price,
  });
}
