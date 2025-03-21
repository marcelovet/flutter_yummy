import 'package:flutter/material.dart';
import 'package:yummy/components/components.dart';
import 'package:yummy/models/models.dart';
import '../api/mock_yummy_service.dart';

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
              PostSection(posts: posts),
              CategorySection(categories: categories),
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