import 'package:flutter/material.dart';
import 'package:yummy/components/category_section.dart';
import 'package:yummy/components/post_section.dart';
import '../api/mock_yummy_service.dart';
import '../components/restaurant_section.dart';

class ExplorePage extends StatelessWidget {
  final mockService = MockYummyService();
  
  ExplorePage({super.key});

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
              RestaurantSection(restaurants: restaurants),
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