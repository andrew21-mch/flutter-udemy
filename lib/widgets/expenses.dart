import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:expense_tracker/data/expenses.dart';
import 'package:expense_tracker/widgets/charts/chart.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/stats.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  List<Expense> _expenses = [];

  @override
  void initState() {
    super.initState();
    _loadExpenses();
  }

  /// **Loads expenses from SharedPreferences**
  Future<void> _loadExpenses() async {
    final prefs = await SharedPreferences.getInstance();
    final expenseData = prefs.getString('expenses');

    if (expenseData != null) {
      final List<dynamic> decodedData = jsonDecode(expenseData);
      setState(() {
        _expenses = decodedData.map((e) => Expense.fromJson(e)).toList();
      });
    }
  }

  /// **Saves expenses to SharedPreferences**
  Future<void> _saveExpenses() async {
    final prefs = await SharedPreferences.getInstance();
    final encodedData = jsonEncode(_expenses.map((e) => e.toJson()).toList());
    await prefs.setString('expenses', encodedData);
  }

  /// **Opens the add expense modal**
  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (ctx) => NewExpense(onAddExpense: _addExpense),
    );
  }

  /// **Adds a new expense**
  void _addExpense(Expense expense) {
    setState(() {
      _expenses.add(expense);
    });
    _saveExpenses(); // Save after adding
  }

  /// **Removes an expense**
  void _removeExpense(Expense expense) {
    final expenseIndex = _expenses.indexOf(expense);
    setState(() {
      _expenses.remove(expense);
    });
    _saveExpenses(); // Save after deleting

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Expense Deleted"),
        duration: Duration(seconds: 3),
        action: SnackBarAction(
          label: "Undo",
          onPressed: () {
            setState(() {
              _expenses.insert(expenseIndex, expense);
            });
            _saveExpenses(); // Save after undo
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final isLargeScreen = width >= 600;

    Widget mainContent = Center(
      child: Card(
        child: Container(
          padding: EdgeInsets.all(12),
          child: SizedBox(
            height: 130,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.hourglass_empty),
                Text("No Expenses Found")
              ],
            ),
          ),
        ),
      ),
    );

    return Scaffold(
        appBar: AppBar(
          title: Text("Expense Tracker"),
          actions: [
            IconButton(
              onPressed: _openAddExpenseOverlay,
              icon: Icon(Icons.add),
            )
          ],
        ),
        body: !isLargeScreen
            ? Column(
                children: [
                  Chart(expenses: _expenses),
                  Stats(expenses: _expenses),
                  Expanded(
                    child: _expenses.isNotEmpty
                        ? ExpensesList(
                            expenses: _expenses,
                            onRemoveExpense: _removeExpense,
                          )
                        : mainContent,
                  ),
                ],
              )
            : Row(
                children: [
                  Expanded(child: Chart(expenses: _expenses)),
                  Expanded(
                    child: _expenses.isNotEmpty
                        ? ExpensesList(
                            expenses: _expenses,
                            onRemoveExpense: _removeExpense,
                          )
                        : mainContent,
                  ),
                ],
              ));
  }
}
