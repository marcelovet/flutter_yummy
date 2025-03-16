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
        _buildSliverAppBar(),
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
  SliverAppBar _buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 300.0,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Center(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 64.0,
              left: 16.0,
              right: 16.0,
            ),
            child: Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    bottom: 30.0,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(16.0),
                    image: DecorationImage(
                      image: AssetImage(widget.restaurant.imageUrl),
                      fit: BoxFit.cover,
                    )
                  ),
                ),
                const Positioned(
                  bottom: 0.0,
                  left: 16.0,
                  child: CircleAvatar(
                    radius: 30.0,
                    child: Icon(
                      Icons.store, color: Colors.white
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
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