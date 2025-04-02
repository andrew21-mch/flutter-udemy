import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final categories = [
      'Category 1',
      'Category 2',
      'Category 3',
      'Category 4',
      'Category 5',
      'Category six',
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick Your Category'),
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ), // i can set the number of columns
        children: [
         ...categories.map(
            (category) {
              return Card(
                color: const Color.fromARGB(255, 131, 57, 0),
                child: Center(
                  child: Text(
                    category,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              );
            },
          ).toList(),
        ],
      ),
    );
  }
}
