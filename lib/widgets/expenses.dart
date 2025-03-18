import 'package:expense_tracker/data/expenses.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _expenses = expenses;

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      context: context, 
      builder: (ctx) => NewExpense()
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expense Tracker", style: TextStyle(
          color: Colors.white
        ),),
        backgroundColor: const Color.fromARGB(255, 9, 77, 67),
        actions: [
          IconButton(onPressed: _openAddExpenseOverlay, icon: Icon(Icons.add), color: Colors.white,)
        ],
      ),
      body: Column(
        children: [
          Text("The Chart Here"),
          Expanded(
            child: ExpensesList(expenses: _expenses),
          ),
        ],
      ),
    );
  }
}
