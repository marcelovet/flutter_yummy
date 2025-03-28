import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yummy/components/components.dart';
import 'package:yummy/constants.dart';
import 'package:yummy/screens/screens.dart';
import 'package:yummy/models/models.dart';

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
  static const double maxWidth = 1000.0;
  static const double drawerWidth = 375.0;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  
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

  Widget _buildGridItem(int index) {
    final item = widget.restaurant.items[index];
    return InkWell(
      onTap: () => _showBottomSheet(item),
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
  
  void _showBottomSheet(Item item) {
    showModalBottomSheet<void>(
      isScrollControlled: true,
      context: context,
      constraints: BoxConstraints(maxWidth: 480.0),
      builder: (context) => ItemDetails(
        item: item,
        cartManager: widget.cartManager,
        quantityUpdated: () => setState(() {}),
      ),
    );
  }

  Widget _buildEndDrawer() {
    return SizedBox(
      width: drawerWidth,
      child: Drawer(
        child: CheckoutPage(
          cartManager: widget.cartManager,
          didUpdate: () => setState(() {}),
          onSubmit: (order) {
            widget.ordersManager.addOrder(order);
            context.pop();
            context.go('/${YummyTab.orders.value}');
          }
        ),
      ),
    );
  }
  
  void openDrawer() {
    scaffoldKey.currentState!.openEndDrawer();
  }

  Widget _buildFloatingActionButton() {
    return FloatingActionButton.extended(
      onPressed: openDrawer,
      tooltip: "Cart",
      icon: const Icon(Icons.shopping_cart),
      label: Text(
        "${widget.cartManager.items.length} items in cart",
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final constrainedWidth = calculateConstrainedtWidth(screenWidth);
    
    return Scaffold(
      key: scaffoldKey,
      endDrawer: _buildEndDrawer(),
      floatingActionButton: _buildFloatingActionButton(),
      body: Center(
        child: SizedBox(
          width: constrainedWidth,
          child: _buildCustomScrollView(),
        )
      ),
    );
  }
}