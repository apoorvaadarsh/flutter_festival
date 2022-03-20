import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_festival/models/item.dart';
import 'package:flutter_festival/screens/add_screen.dart';
import '../widgets/expense_card.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

// void loadData() {
//   FirebaseFirestore.instance('items').get().then((value) {
//     print(value.docs);
//   });
// }

class _HomeScreenState extends State<HomeScreen> {
  List<Item> _itemList = [];
  @override
  @override
  Widget build(BuildContext context) {
    final firebaseCollection = FirebaseFirestore.instance.collection('items');
    initState() {
      super.initState();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Container(
        child: StreamBuilder<QuerySnapshot>(
          stream: firebaseCollection.snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            final items = snapshot.data;
            if (items == null) return Container();
            _itemList = [];
            for (var item in items.docs) {
              _itemList.add(Item(name: item['name'], price: item['price']));
            }
            return ListView.builder(
              itemCount: _itemList.length,
              itemBuilder: (context, index) {
                return ExpenseCard(
                  item: _itemList[index],
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.of(context).pushNamed(AddScreen.routeName).then(
                (_item) => setState(() {
                  _itemList.add(_item as Item);
                  firebaseCollection.add({
                    'name': _item.name,
                    'price': _item.price,
                  }).then(
                    (value) {
                      print(value);
                      print('added');
                    },
                  );
                }),
              );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
