import 'package:flutter/material.dart';
import '../components/restaurant_landscape_card.dart';
import '../models/restaurant.dart';

class RestaurantSection extends StatelessWidget {
  final List<Restaurant> restaurants;
  
  const RestaurantSection({super.key, required this.restaurants});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 16.0, bottom: 8.0),
            child: Text(
              "Food near me",
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
          ),
          // TODO: add resturant list view
          Container(
            height: 400,
            // TODO: add ListView here
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}