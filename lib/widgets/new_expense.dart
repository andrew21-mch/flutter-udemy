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
  // var _enteredTitle = '';

  // void _saveTitleInput(String inputValue){
  //   _enteredTitle = inputValue;
  // }

  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;

  Category _selectedCategory = Category.food;

  void setCategory(category) {
    setState(() {
      _selectedCategory = category;
    });
  }

  void submitExpenseData() {
    final enteredAmount = double.tryParse(_amountController.text.trim());
    final amountIsInvalid =
        (enteredAmount == null) || (enteredAmount <= 0) ? true : false;

    if (_titleController.text.trim().isEmpty ||
        amountIsInvalid ||
        _selectedDate == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          icon: Icon(Icons.warning),
          iconColor: Colors.red,
          title: Text("invalid input"),
          content: Text(
              "Please make sure a valid title, amount, date and catery where entered"),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(ctx);
                },
                child: Text("Okay"))
          ],
        ),
      );
      return;
    }

    widget.onAddExpense(Expense(
        title: _titleController.text,
        amount: enteredAmount,
        date: _selectedDate!,
        category: _selectedCategory));

    // showDialog(
    //   context: context,
    //   builder: (ctc) => AlertDialog(
    //     title: Text("Expense Added"),
    //     content: Text("Your Expenese was added"),
    //     icon: Icon(Icons.check),
    //     iconColor: Colors.green,
    //     actions: [
    //       TextButton(
    //         onPressed: () => Navigator.pop(context),
    //         child: Text("Close"),
    //       )
    //     ],
    //   ),
    // );

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
    super.dispose();
    _titleController.dispose();
    _amountController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(16, 120, 16, 16),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              maxLength: 100,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  icon: Icon(Icons.title), label: Text("Enter Title")),
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
                    style: ButtonStyle(),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Cancel")),
                ElevatedButton(
                  onPressed: () {
                    submitExpenseData();
                  },
                  child: Text("Save Expense"),
                ),
                Spacer(),
              ],
            )
          ],
        ));
  }
}
