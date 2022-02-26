import 'package:flutter/material.dart';

class ExpenseCard extends StatelessWidget {
  String? expenseTitle;
  ExpenseCard({@required this.expenseTitle});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: ListTile(
        title: Text(expenseTitle.toString()),
        trailing: Text('\$100'),
        subtitle: Text('26/02/2022'),
      ),
    );
  }
}
