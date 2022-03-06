import 'package:flutter/material.dart';
import 'package:flutter_festival/models/item.dart';
import 'package:flutter_festival/screens/add_screen.dart';
import '../widgets/expense_card.dart';

class HomeScreen extends StatefulWidget {
  // HomeScreen({Key? key}) : super(key: key);
  // Item _item;
  // HomeScreen(this._item);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Item> _itemList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Container(
        child: _itemList.isEmpty
            ? Center(
                child: Text('No Items'),
              )
            : ListView.builder(
                itemBuilder: (context, index) {
                  return ExpenseCard(
                    item: _itemList[index],
                  );
                },
                itemCount: _itemList.length,
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.of(context).pushNamed(AddScreen.routeName).then(
                (_item) => setState(() {
                  _itemList.add(_item as Item);
                }),
              );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
