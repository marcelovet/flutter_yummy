import 'package:flutter/material.dart';
import 'package:yummy/components/category_section.dart';
import 'package:yummy/components/post_section.dart';
import 'package:yummy/models/cart_manager.dart';
import 'package:yummy/models/order_manager.dart';
import '../api/mock_yummy_service.dart';
import '../components/restaurant_section.dart';

class ExplorePage extends StatelessWidget {
  final mockService = MockYummyService();
  final CartManager cartManager;
  final OrderManager orderManager;
  
  ExplorePage({
    super.key,
    required this.cartManager,
    required this.orderManager,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: mockService.getExploreData(),
      builder: (context, AsyncSnapshot<ExploreData> snaphot) {
        if(snaphot.connectionState == ConnectionState.done) {
          final restaurants = snaphot.data?.restaurants ?? []; // if null return empty list
          final categories = snaphot.data?.categories ?? [];
          final posts = snaphot.data?.friendPosts ?? [];
          return ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: [
              RestaurantSection(
                restaurants: restaurants,
                cartManager: cartManager,
                orderManager: orderManager,
              ),
              CategorySection(categories: categories),
              PostSection(posts: posts),
            ],
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}