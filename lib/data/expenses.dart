import 'package:expense_tracker/models/expense.dart';

final List<Expense> expenses = [
  Expense(
      title: "Flutter Course",
      amount: 19.99,
      date: DateTime(2020, 1, 1),
      category: Category.school),
  Expense(
      title: "Food",
      amount: 12.99,
      date: DateTime(2025, 1, 1),
      category: Category.food),
  Expense(
      title: "Trip to Dubai",
      amount: 200.12,
      date: DateTime(2025, 12, 1),
      category: Category.travel),
  Expense(
      title: "Dart Course",
      amount: 12.12,
      date: DateTime.now(),
      category: Category.travel),
];
