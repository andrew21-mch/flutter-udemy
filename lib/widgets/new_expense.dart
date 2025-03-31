import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});

  final Function(Expense expense) onAddExpense;

  @override
  State<StatefulWidget> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  final _descriptionController =
      TextEditingController(); // Added description controller
  DateTime? _selectedDate;
  Category _selectedCategory = Category.food;

  void setCategory(Category category) {
    setState(() {
      _selectedCategory = category;
    });
  }

  _showDialog() {
    if (Platform.isIOS) {
      showCupertinoDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          icon: Icon(Icons.warning),
          iconColor: Colors.red,
          title: Text("Invalid Input"),
          content: Text(
              "Please make sure a valid title, amount, date, and category were entered."),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(ctx);
                },
                child: Text("Okay"))
          ],
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          icon: Icon(Icons.warning),
          iconColor: Colors.red,
          title: Text("Invalid Input"),
          content: Text(
              "Please make sure a valid title, amount, date, and category were entered."),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(ctx);
                },
                child: Text("Okay"))
          ],
        ),
      );
    }
  }

  void submitExpenseData() {
    final enteredAmount = double.tryParse(_amountController.text.trim());
    final amountIsInvalid = (enteredAmount == null) || (enteredAmount <= 0);
    final enteredTitle = _titleController.text.trim();
    final enteredDescription = _descriptionController.text.trim();

    if (enteredTitle.isEmpty || amountIsInvalid || _selectedDate == null) {
      _showDialog();
      return;
    }

    widget.onAddExpense(Expense(
      title: enteredTitle,
      amount: enteredAmount,
      date: _selectedDate!,
      category: _selectedCategory,
      description: enteredDescription.isNotEmpty ? enteredDescription : null,
    ));

    Navigator.pop(context);
  }

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);

    final pickedDate = await showDatePicker(
        context: context, firstDate: firstDate, lastDate: now);

    setState(() {
      _selectedDate = pickedDate;
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    _descriptionController.dispose(); // Dispose the new controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;
      
      return SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(16, 32, 16, keyboardSpace),
          child: Column(
            children: [
              TextField(
                controller: _titleController,
                maxLength: 100,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    icon: Icon(Icons.title), label: Text("Enter Title")),
              ),
              TextField(
                controller: _descriptionController,
                maxLength: 200,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    icon: Icon(Icons.description),
                    label: Text("Enter Description (Optional)")),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _amountController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          prefixText: "XOF ",
                          icon: Icon(Icons.money),
                          label: Text("How much")),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(_selectedDate == null
                            ? "No date selected"
                            : formatter.format(_selectedDate!)),
                        IconButton(
                          onPressed: _presentDatePicker,
                          icon: Icon(Icons.calendar_month),
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Spacer(),
                  DropdownButton(
                      value: _selectedCategory,
                      items: Category.values.map((item) {
                        return DropdownMenuItem(
                          value: item,
                          child: Text(
                            item.name.toUpperCase(),
                          ),
                        );
                      }).toList(),
                      onChanged: (value) => setCategory(value!)),
                  Spacer(),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Cancel")),
                  ElevatedButton(
                    onPressed: submitExpenseData,
                    child: Text("Save Expense"),
                  ),
                  Spacer(),
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}
