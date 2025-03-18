import 'dart:math';

import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});
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

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _amountController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(16),
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
                const SizedBox(
                  width: 60,
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text("Selected Date"),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.calendar_month),
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    print(_titleController.text);
                    print(_amountController.text);
                  },
                  child: Text("Save Expense"),
                ),
                ElevatedButton(
                    style: ButtonStyle(),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Cancel"))
              ],
            )
          ],
        ));
  }
}
