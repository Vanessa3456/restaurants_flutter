import 'package:flutter/material.dart';
import '../models/food_category.dart';

class CategoryCard extends StatelessWidget {
// 1
  final FoodCategory category;
  const CategoryCard({
    super.key,
    required this.category,
  });
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context)
        .textTheme
        .apply(displayColor: Theme.of(context).colorScheme.onSurface);

    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              // 1
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(8.0)),
                child: Image.asset(category.imageUrl),
              ),
              // 2

              // 3
              Positioned(
                //top: 16.0,
                child: Center(
                  child: Text(
                    'Smoothies',
                    style: textTheme.headlineLarge,
                  ),
                ),
              ),
            ],
          ),
          ListTile(
            title: Text(category.name,
            style: textTheme.titleSmall,),
            subtitle: Text(
              '${category.numberOfRestaurants} places',
              style: textTheme.bodySmall,
            ),
          )
        ],
      ),
    );
  }
}
