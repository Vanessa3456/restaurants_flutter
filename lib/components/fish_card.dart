import 'package:flutter/material.dart';
import 'package:restaurant/models/fish.dart';
import '../models/food_category.dart';

class FishCard extends StatelessWidget {
// 1
  final Fish fishCard;
  const FishCard({
    super.key,
    required this.fishCard
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
                child: Image.asset(fishCard.imageUrl),
              ),
              // 2

              // 3
              Positioned(
                //top: 16.0,
                child: Center(
                  child: Text(
                    'Salmon',
                    style: textTheme.headlineLarge,
                  ),
                ),
              ),
            ],
          ),
          // ListTile(
          //   title: Text(fishCard.name,
          //   style: textTheme.titleSmall,),
          //   subtitle: Text(
          //     '${fishCard.lo} places',
          //     style: textTheme.bodySmall,
          //   ),
          // )
        ],
      ),
    );
  }
}
