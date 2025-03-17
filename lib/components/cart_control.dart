import 'package:flutter/material.dart';

class CartControl extends StatefulWidget {
  final void Function(int) addToCart;
  const CartControl({super.key, required this.addToCart});

  @override
  State<CartControl> createState() => _CartControlState();
}

class _CartControlState extends State<CartControl> {
  int _cartNumber = 1;
  
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // TODO: add cart control components
        Container(
          color: Colors.red,
          height: 48.0,
        ),
      ],
    );
  }

  // TODO: build minus button
  // TODO: build plus button
  // TODO: build cart number
  // TODO: build add to cart button
}