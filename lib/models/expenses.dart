import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();
const uuid = Uuid();

enum Category {food , travel , leisure , work} //catrgory accepts only these four values with the help of enum keyword 

const categoryIcons = {
  Category.food : Icons.lunch_dining,
  Category.travel : Icons.flight_takeoff,
  Category.leisure : Icons.movie,
  Category.work : Icons.work,
};

class Expense{
  Expense({
    required this.title , //different properties of an expense it would have title amount and date whenever it is made 
    required this.amount , 
    required this.date,
    required this.category,
  }) : id = uuid.v4(); //generates a unique string and assigns it to id values whenever expense is called 
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  //final String category; -- this creates error as whenever there is a typo it does not identify it to flexible 
  final Category category;

  String get formattedDate{
    return formatter.format(date);
  }
}

class ExpenseBucket{
  const ExpenseBucket({
    required this.category,
    required this.expenses,
  });

  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category) 
     : expenses = allExpenses
      .where((element) => element.category == category)
      .toList();

  final Category category;
  final List<Expense>expenses;

  double get totalExpenses{
    double sum =0;

    for (final expense in expenses){
      sum = sum + expense.amount;
    }
    return sum;
  }
}