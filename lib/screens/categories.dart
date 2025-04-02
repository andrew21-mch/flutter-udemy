import 'package:flutter/material.dart';
import 'package:mealsapp/data/dummy_data.dart';
import 'package:mealsapp/models/category.dart';
import 'package:mealsapp/screens/meals.dart';
import 'package:mealsapp/widgets/category_grid_item.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = dummyMeals.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MealsScreen(
          title: category.title,
          meals: filteredMeals,
        ),
      ),
    );
    // Navigator.of(context).push(route);
  }

  @override
  Widget build(BuildContext context) {
    final categories = availableCategories;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick Your Category'),
      ),
      body: GridView(
        padding: const EdgeInsets.all(20),

        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ), // i can set the number of columns
        children: [
          //  ...categories.map(
          //     (category) {
          //       return CategoryGridItem(
          //         category: category,
          //       );
          //     },
          //   ),
          for (final category in categories)
            CategoryGridItem(
              category: category,
              onSelectCategory: (categoryId) {
                _selectCategory(context, category);
              },
            ),
        ],
      ),
    );
  }
}
