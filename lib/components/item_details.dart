import 'package:flutter/material.dart';
import '../models/restaurant.dart';
import '../models/cart_manager.dart';

class ItemDetails extends StatefulWidget {
  final Item item;
  final CartManager cartManager;
  final void Function() quantityUpdated;

  const ItemDetails({
    super.key,
    required this.item,
    required this.cartManager,
    required this.quantityUpdated,
  });

  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context)
      .textTheme
      .apply(displayColor: Theme.of(context).colorScheme.onSurface);
    final colorTheme = Theme.of(context).colorScheme;
    
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Wrap(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.item.name,
                    style: textTheme.headlineMedium,
                  ),
                  Text(
                    widget.item.price.toStringAsFixed(2),
                    style: textTheme.headlineSmall,
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              _mostLikedBadge(colorTheme),
              const SizedBox(height: 16.0),
              Text(widget.item.description),
              const SizedBox(height: 16.0),
              _itemImage(widget.item.imageUrl),
              // TODO: add cart control
            ],
          ),
        ],
      ),
    );
  }

  Widget _mostLikedBadge(ColorScheme colorTheme) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.all(4.0),
        color: colorTheme.onPrimary,
        child: const Text("#1 Most liked"),
      ),
    );
  }
  
  Widget _itemImage(String imageUrl) {
    return Container(
      height: 200.0,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
    );
  }
  
  // TODO: Create cart control
  
}