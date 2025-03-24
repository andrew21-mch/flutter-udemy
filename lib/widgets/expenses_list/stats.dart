import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class Stats extends StatelessWidget {
  const Stats({super.key, required this.expenses});

  final List<Expense> expenses;

  double totalExpenses() {
    return expenses.fold(0, (sum, item) => sum + item.amount);
  }

  List<ExpenseBucket> get buckets {
    return [
      ExpenseBucket.forCategory(expenses, Category.food),
      ExpenseBucket.forCategory(expenses, Category.leisure),
      ExpenseBucket.forCategory(expenses, Category.travel),
      ExpenseBucket.forCategory(expenses, Category.work),
      ExpenseBucket.forCategory(expenses, Category.school),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final total = totalExpenses();
    final bucketData = buckets.where((b) => b.totalExpenses > 0).toList();
    bucketData.sort((a, b) =>
        b.totalExpenses.compareTo(a.totalExpenses)); // Sort descending

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Total Expenses: XOF ${total.toStringAsFixed(2)}',
                style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
