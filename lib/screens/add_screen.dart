import 'package:flutter/material.dart';
import 'package:flutter_festival/models/item.dart';

class AddScreen extends StatefulWidget {
  static const routeName = '/add-screen';
  const AddScreen({Key? key}) : super(key: key);

  @override
  _AddScreenState createState() => _AddScreenState();
}

TextEditingController _itemNameController = TextEditingController();
TextEditingController _itemPriceController = TextEditingController();
Item _item = Item(name: '', price: ' ');
String? _itemName = '';
String? _itemPrice = '';

class _AddScreenState extends State<AddScreen> {
  void _addItem() {
    setState(() {
      _itemName = _itemNameController.text;
      _itemPrice = _itemPriceController.text;
      _item = Item(name: _itemName, price: _itemPrice);
      _itemNameController.clear();
      _itemPriceController.clear();
      _itemName = '';
      _itemPrice = '';
    });
    Navigator.of(context).pop(_item);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add Screen'),
        ),
        body: Column(
          children: [
            TextField(
              controller: _itemNameController,
              decoration: InputDecoration(
                hintText: 'Enter your item name',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: _itemPriceController,
              decoration: InputDecoration(
                hintText: 'Enter your item price',
              ),
              keyboardType: TextInputType.number,
              onSubmitted: (value) {
                print('Item Price $value');
              },
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: _addItem,
              child: Text('Add Item'),
            ),
          ],
        ));
  }
}
