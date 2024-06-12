import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();
final formatter=DateFormat.yMd(); 
enum Category { food, travel, leisure, work }
const categoryIcons={
  Category.food:Icons.lunch_dining,
  Category.leisure:Icons.movie,
  Category.travel:Icons.flight,
  Category.work:Icons.work
};

class ExpenseDataClass {
  ExpenseDataClass(
      {required this.title,
      required this.amount,
      required this.dateTime,
      required this.category})
      : id = uuid.v4();
  final String id;
  final String title;
  final double amount;
  final DateTime dateTime;
  final Category category;
  String get formattedDate {
    return formatter.format(dateTime);
  }
}
