import 'package:flutter/material.dart';
import '../models/restaurant.dart';

class RestaurantLandscapeCard extends StatelessWidget {
  final Restaurant restaurant;
  
  const RestaurantLandscapeCard({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context)
      .textTheme
      .apply(displayColor: Theme.of(context).colorScheme.onSurface);
    
    return const Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // TODO: add image
          // TODO: add ListTile
        ],
      ),
    );
  }
}