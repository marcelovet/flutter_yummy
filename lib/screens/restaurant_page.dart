import 'package:flutter/material.dart';
import 'package:yummy/components/restaurant_item.dart';
import '../models/restaurant.dart';
import '../models/cart_manager.dart';
import '../models/order_manager.dart';

class RestaurantPage extends StatefulWidget {
  final Restaurant restaurant;
  final CartManager cartManager;
  final OrderManager ordersManager;
  
  const RestaurantPage({
    super.key,
    required this.restaurant,
    required this.cartManager,
    required this.ordersManager,
  });

  @override
  State<RestaurantPage> createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {
  static const desktopThreshold = 700;
  static const double largeScreenPercentage = 0.9;
  static const double maxWidth = 1000;
  // TODO: Define Drawer Max Width
  // TODO: Define Scaffold Key
  
  double calculateConstrainedtWidth(double screenWidth){
    return (
      screenWidth > desktopThreshold
        ? screenWidth * largeScreenPercentage
        : screenWidth
    ).clamp(0.0, maxWidth);
  }

  int calculateColumnCount(double screenWidth){
    return screenWidth > desktopThreshold ? 2 : 1;
  }

  CustomScrollView _buildCustomScrollView() {
    return CustomScrollView(
      slivers: [
        _buildSliverAppBar(),
        _buidInfoSection(),
        _buildGridViewSection('Menu'),
      ],
    );
  }
  
  SliverAppBar _buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 300.0,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Center(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 64.0,
              left: 16.0,
              right: 16.0,
            ),
            child: Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    bottom: 30.0,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(16.0),
                    image: DecorationImage(
                      image: AssetImage(widget.restaurant.imageUrl),
                      fit: BoxFit.cover,
                    )
                  ),
                ),
                const Positioned(
                  bottom: 0.0,
                  left: 16.0,
                  child: CircleAvatar(
                    radius: 30.0,
                    child: Icon(
                      Icons.store, color: Colors.white
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  
  SliverToBoxAdapter _buidInfoSection() {
    final textTheme = Theme.of(context).textTheme;
    final restaurant = widget.restaurant;

    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(restaurant.name, style: textTheme.headlineLarge),
            Text(restaurant.address, style: textTheme.bodySmall),
            Text(restaurant.getRatingAndDistance(), style: textTheme.bodySmall),
            Text(restaurant.attributes, style: textTheme.labelSmall),
          ],
        ),
      ),
    );
  }

  // TODO: build grid item
  Widget _buildGridItem(int index) {
    final item = widget.restaurant.items[index];
    return InkWell(
      onTap: () {
        // Present Bottom Sheet in the future.
      },
      child: RestaurantItem(item: item),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
  
  Widget _buildGridView(int columns) {
    return GridView.builder(
      padding: EdgeInsets.all(0.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 16.0,
        crossAxisSpacing: 16.0,
        childAspectRatio: 3.5,
        crossAxisCount: columns,
      ),
      itemBuilder: (context, index) => _buildGridItem(index),
      itemCount: widget.restaurant.items.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
    );
  }
  
  SliverToBoxAdapter _buildGridViewSection(String title) {
    final columns = calculateColumnCount(MediaQuery.of(context).size.width);
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle(title),
            _buildGridView(columns),
          ],
        ),
      ),
    );
  }
  
  // TODO: Show Bottom Sheet
  // TODO: Create Drawer
  // TODO: Open Drawer
  // TODO: Create Floating Action Button
  
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final constrainedWidth = calculateConstrainedtWidth(screenWidth);
    
    return Scaffold(
      // TODO: Add Scaffold Key
      // TODO: Apply Drawer
      // TODO: Apply Floating Action Button
      body: Center(
        child: SizedBox(
          width: constrainedWidth,
          child: _buildCustomScrollView(),
        )
      ),
    );
  }
}