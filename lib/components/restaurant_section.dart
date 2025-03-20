import 'package:flutter/material.dart';
import 'package:yummy/models/models.dart';
import 'package:yummy/screens/screens.dart';
import 'package:yummy/components/components.dart';

class RestaurantSection extends StatelessWidget {
  final List<Restaurant> restaurants;
  final CartManager cartManager;
  final OrderManager orderManager;
  
  const RestaurantSection({
    super.key,
    required this.restaurants,
    required this.cartManager,
    required this.orderManager,
  });

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
          SizedBox(
            height: 230,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: restaurants.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  width: 300,
                  child: RestaurantLandscapeCard(
                    restaurant: restaurants[index],
                    onTap: () {
                      // TODO: Navigate to Restaurant using go_router
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RestaurantPage(
                            restaurant: restaurants[index],
                            cartManager: cartManager,
                            ordersManager: orderManager,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}