import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseDetail extends StatefulWidget {
  const ExpenseDetail({super.key, required this.expense});

  final Expense expense;

  @override
  State<ExpenseDetail> createState() => _ExpenseDetailState();
}

class _ExpenseDetailState extends State<ExpenseDetail> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Detail'),
        backgroundColor: colorScheme.primary, // Uses theme primary color
        elevation: 4,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: colorScheme.primaryContainer, // Themed background
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.expense.title,
                        style: theme.textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: colorScheme.onPrimaryContainer, // Themed text color
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            'XOF ${widget.expense.amount.toStringAsFixed(2)}',
                            style: theme.textTheme.titleLarge?.copyWith(
                              color: colorScheme.onPrimaryContainer,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              Icon(categoryIcons[widget.expense.category], 
                                  color: colorScheme.onPrimaryContainer),
                              const SizedBox(width: 8),
                              Text(
                                widget.expense.formatedDate,
                                style: TextStyle(color: colorScheme.onPrimaryContainer),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: colorScheme.surfaceContainerHighest, // Themed surface color
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  "Description: \n\n${widget.expense.description}",
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: colorScheme.onSurfaceVariant, // Themed text
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
