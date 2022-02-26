import 'package:flutter/material.dart';
import '../widgets/expense_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Container(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return ExpenseCard(
              expenseTitle: 'Expense ${index + 1}',
            );
          },
          itemCount: 20,
        ),
      ),
    );
  }
}
