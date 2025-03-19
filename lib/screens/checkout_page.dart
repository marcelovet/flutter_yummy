import 'package:flutter/material.dart';
import '../models/cart_manager.dart';
import '../models/order_manager.dart';

class CheckoutPage extends StatefulWidget {
  final CartManager cartManager;
  final Function() didUpdate;
  final Function(Order) onSubmit;
  
  const CheckoutPage({
    super.key,
    required this.cartManager,
    required this.didUpdate,
    required this.onSubmit,
  });

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  // TODO: add state properties
  // TODO: configure date format
  // TODO: configure time of day
  // TODO: set selected segment
  // TODO: build name textfield
  // TODO: select date picker
  // TODO: select time picker
  // TODO: build order summary
  // TODO: build submit order button
  
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context)
      .textTheme
      .apply(displayColor: Theme.of(context).colorScheme.onSurface);
    
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Order details',
              style: textTheme.headlineSmall,
            ),
            // TODO: add segmented control
            // TODO: add name textfield
            // TODO: add date and time picker
            // TODO: add order summary
            // TODO: add submit order button
          ],
        ),
      )
    );
  }
}