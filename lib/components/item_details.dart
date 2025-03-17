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
    
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Wrap(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.item.name,
                style: textTheme.headlineMedium,
              ),
              // TODO: add liked badge
              Text(widget.item.description),
              // TODO: add Item price?
              // TODO: add Item image
              // TODO: add cart control
            ],
          ),
        ],
      ),
    );
  }

  // TODO: Create most liked badge
  // TODO: Create item image
  // TODO: Create cart control
}