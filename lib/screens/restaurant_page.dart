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

  CustomScrollView _buildCustomScrollView() {
    return CustomScrollView(
      slivers: [
        // TODO: add sliver app bar
        SliverToBoxAdapter(
          child: Container(
            height: 200.0,
            color: Colors.red,
          ),
        ),
        // TODO: add info section
        SliverToBoxAdapter(
          child: Container(
            height: 200.0,
            color: Colors.green,
          ),
        ),
        // TODO: add menu item grid view section
        SliverFillRemaining(
          child: Container(
            color: Colors.blue,
          ),
        )
      ],
    );
  }
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
        child: _buildCustomScrollView(),
      ),
    );
  }
}