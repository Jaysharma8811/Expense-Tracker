import 'package:expense_tracker/model/expenseDataClass.dart';
import 'package:expense_tracker/widgets/add_expense.dart';
import 'package:expense_tracker/widgets/chart.dart';
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
      builder: (ctx) => AddExpense(
        onAddExpense: _addExpense,
      ),
    );
  }

  void _addExpense(ExpenseDataClass expense) {
    setState(() {
      _registerExpenses.add(expense);
    });
  }

  void _removeExpense(ExpenseDataClass expense) {
    final expenseIndex = _registerExpenses.indexOf(expense);
    setState(() {
      _registerExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Expense deleted.'),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registerExpenses.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent=const Center(
      child: Text('No expenses found. Start adding some!'),
    );
    if(_registerExpenses.isNotEmpty){
       mainContent=ExpenseList(
         expense: _registerExpenses,
         onRemoveExpense: _removeExpense,
       );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'),
        actions: [
          IconButton(
              onPressed: _openAddExpenseOverlay, icon: const Icon(Icons.add))
        ],
      ),
      body: Column(
        children: [
          Chart(expenses: _registerExpenses),
          Expanded(
            child:mainContent,
          )
        ],
      ),
    );
  }
}
