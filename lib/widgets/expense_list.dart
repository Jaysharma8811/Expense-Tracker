import 'package:expense_tracker/model/expenseDataClass.dart';
import 'package:expense_tracker/views/expense_view.dart';
import 'package:expense_tracker/widgets/expense_list_item.dart';
import 'package:flutter/material.dart';

class ExpenseList extends StatelessWidget{
  const ExpenseList({super.key,required this.expense});
 final List<ExpenseDataClass> expense;
  @override
  Widget build(BuildContext context) {
   return  ListView.builder(
     itemCount: expense.length,
       itemBuilder: (ctx,index){
       return ExpenseItem(expense[index] );
       });
  }

}