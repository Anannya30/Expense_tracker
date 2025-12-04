import 'package:expense_tracker/models/expenses.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget{ //output the list of data
  const ExpensesList({super.key,required this.expenses,required this.onRemoveExpense});

  final void Function(Expense expense) onRemoveExpense;


  final List<Expense> expenses;
   @override
   Widget build(BuildContext context){
    return ListView.builder(
      itemCount: expenses.length , 
      itemBuilder:(ctx , index) => Dismissible( //helps to remove an item by swipping it
        key:ValueKey(expenses [index]),
        background: Container(
          color: Theme.of(context).colorScheme.error.withValues(alpha: 0.75),
          margin: EdgeInsets.symmetric(horizontal: Theme.of(context).cardTheme.margin!.horizontal),
        ), 
        onDismissed: (direction){
          onRemoveExpense(expenses[index]);
        },
        child:ExpensesItem(expenses [index])),
    );
   }
}