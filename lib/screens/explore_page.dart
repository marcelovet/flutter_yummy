import 'package:flutter/material.dart';
import '../api/mock_yummy_service.dart';
import '../components/restaurant_section.dart';

class ExplorePage extends StatelessWidget {
  final mockService = MockYummyService();
  
  ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: add ListView Future Builder
    
    return FutureBuilder(
      future: mockService.getExploreData(),
      builder: (context, AsyncSnapshot<ExploreData> snaphot) {
        if(snaphot.connectionState == ConnectionState.done) {
          final restaurants = snaphot.data?.restaurants ?? []; // if null return empty list
          final categories = snaphot.data?.categories ?? [];
          final posts = snaphot.data?.friendPosts ?? [];
          // TODO: wrap in ListView
          return RestaurantSection(restaurants: restaurants);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}