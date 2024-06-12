import 'package:expense_tracker/views/expense_view.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(  MaterialApp(
    theme: ThemeData(useMaterial3: true),
    home:Expense() ,
  ));
 }