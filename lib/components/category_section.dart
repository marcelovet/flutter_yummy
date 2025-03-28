import 'package:flutter/material.dart';
import 'package:yummy/components/components.dart';
import 'package:yummy/models/models.dart';

class CategorySection extends StatelessWidget {
  final List<FoodCategory> categories;

  const CategorySection({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 16.0, bottom: 8.0),
            child: Text(
              "Categories",
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 275,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  width: 200,
                  child: CategoryCard(
                    category: categories[index],
                  ),
                );
              },
            ),
          ),
        ],
      )
    );
  }
}