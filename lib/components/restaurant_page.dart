import 'package:flutter/material.dart';
import '../models/restaurant.dart';

class RestaurantPage extends StatefulWidget {
  final Restaurant restaurant;
  const RestaurantPage({super.key, required this.restaurant});

  @override
  State<RestaurantPage> createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {
  // TODO: add Desktop Threshold
  // TODO: add Constraint properties
  // TODO: Calculate constraint width
  // TODO: add calculate column count

  // TODO: build custom scroll view
  // TODO: build sliver app bar
  // TODO: build info section
  // TODO: build grid item
  // TODO: build section title
  // TODO: build grid view
  // TODO: build grid view section
  
  // TODO: replace build method
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // TODO: replace with custom scroll view
        child: Text(
          "Restaurant page",
          style: TextStyle(fontSize: 16.0),
        ),
      ),
    );
  }
}