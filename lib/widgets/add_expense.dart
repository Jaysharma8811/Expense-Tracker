import 'package:flutter/material.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AddExpenseState();
  }
}

class _AddExpenseState extends State<AddExpense> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:const  EdgeInsets.all(16),
      child: Column(
        children:const [
          TextField(
            maxLength: 50,
            decoration: InputDecoration(label: Text('Title')),
          )
        ],
      ),
    );
  }
}
