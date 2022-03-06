import 'package:flutter/material.dart';

import '../models/item.dart';
import 'package:intl/intl.dart';

class ExpenseCard extends StatelessWidget {
  Item? item;

  ExpenseCard({@required this.item});
  @override
  Widget build(BuildContext context) {
    DateTime date = item?.date ?? DateTime.now();
    return Card(
      elevation: 2,
      child: ListTile(
        title: Text(item?.name ?? ' '),
        trailing: Text(item?.price ?? ' '),
        subtitle: Text(DateFormat('dd/MM/yy').format(date)),
      ),
    );
  }
}
