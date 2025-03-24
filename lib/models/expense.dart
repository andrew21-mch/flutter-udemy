import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

const uuid = Uuid();

const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
  Category.school: Icons.school,
};

enum Category { food, travel, leisure, work, school }

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
    this.description, // Nullable description
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;
  final String? description; // Nullable description

  get formatedDate {
    return formatter.format(date);
  }

  // Convert Expense object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'amount': amount,
      'date': date.toIso8601String(),
      'category': category.index, // Storing category as index
      'description': description,
    };
  }

  // Create Expense object from JSON
  factory Expense.fromJson(Map<String, dynamic> json) {
    return Expense(
      title: json['title'],
      amount: json['amount'],
      date: DateTime.parse(json['date']),
      category: Category.values[json['category']],
      description: json['description'],
    );
  }
}

class ExpenseBucket {
  ExpenseBucket({required this.category, required this.expenses});

  ExpenseBucket.forCategory(List<Expense> expenses, this.category)
      : expenses = expenses.where((element) => element.category == category).toList();

  final Category category;
  final List<Expense> expenses;

  double get totalExpenses {
    return expenses.fold(0, (sum, expense) => sum + expense.amount);
  }

  // Convert ExpenseBucket to JSON
  Map<String, dynamic> toJson() {
    return {
      'category': category.index,
      'expenses': expenses.map((e) => e.toJson()).toList(),
    };
  }

  // Create ExpenseBucket from JSON
  factory ExpenseBucket.fromJson(Map<String, dynamic> json) {
    return ExpenseBucket(
      category: Category.values[json['category']],
      expenses: (json['expenses'] as List<dynamic>)
          .map((e) => Expense.fromJson(e))
          .toList(),
    );
  }
}
