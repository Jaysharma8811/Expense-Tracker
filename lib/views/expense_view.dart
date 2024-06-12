import 'package:expense_tracker/model/expenseDataClass.dart';
import 'package:expense_tracker/widgets/add_expense.dart';
import 'package:expense_tracker/widgets/expense_list.dart';
import 'package:flutter/material.dart';

class Expense extends StatefulWidget {
  const Expense({super.key});

  @override
  State<Expense> createState() {
    return _ExpenseState();
  }
}

class _ExpenseState extends State<Expense> {
  final List<ExpenseDataClass> _registerExpenses = [
    ExpenseDataClass(
      title: 'Flutter Course',
      amount: 19.99,
      dateTime: DateTime.now(),
      category: Category.work,
    ),
    ExpenseDataClass(
      title: 'Cinema',
      amount: 15.69,
      dateTime: DateTime.now(),
      category: Category.leisure,
    ),
  ];
  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => const AddExpense(),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'),
        actions: [
          IconButton(onPressed:_openAddExpenseOverlay, icon: const Icon(Icons.add))
        ],
      ),
      body: Column(
        children: [
          const Text('The chart..'),
          Expanded(
            child: ExpenseList(expense: _registerExpenses),
          )
        ],
      ),
    );
  }
}
