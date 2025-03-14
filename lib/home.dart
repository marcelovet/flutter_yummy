import 'package:flutter/material.dart';
import 'constants.dart';
import 'components/theme_button.dart';
import 'components/color_button.dart';
import 'components/category_card.dart';
import '../models/food_category.dart';
import 'components/post_card.dart';
import '../models/post.dart';
import 'components/restaurant_landscape_card.dart';
import '../models/restaurant.dart';

class Home extends StatefulWidget {
  final void Function(bool useLightMode) changeTheme;
  final void Function(int value) changeColor;
  final ColorSelection colorSelected;
  final String appTitle;
  
  const Home({
    super.key,
    required this.changeTheme,
    required this.changeColor,
    required this.colorSelected,
    required this.appTitle,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int tab = 0;
  List<NavigationDestination> appBarDestinations =[
    NavigationDestination(
      icon: Icon(Icons.credit_card),
      label: 'Category',
      selectedIcon: Icon(Icons.credit_card),
    ),
    NavigationDestination(
      icon: Icon(Icons.credit_card),
      label: 'Post',
      selectedIcon: Icon(Icons.credit_card),
    ),
    NavigationDestination(
      icon: Icon(Icons.credit_card),
      label: 'Restaurant',
      selectedIcon: Icon(Icons.credit_card),
    ),
  ];
  
  @override
  Widget build(BuildContext context) {
    final pages = [
      Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 300),
          child: CategoryCard(
            category: categories[0],
          ),
        ),
      ),
      Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: PostCard(
            post: posts[0],
          ),
        ),
      ),
      Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 400),
          child: RestaurantLandscapeCard(
            restaurant: restaurants[0],
          ),
        ),
      )
    ];
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          ThemeButton(changeThemeMode: widget.changeTheme),
          ColorButton(changeColor: widget.changeColor, colorSelected: widget.colorSelected),
        ],
        elevation: 4.0,
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: IndexedStack(
          index: tab,
          children: pages,
        ),
      ),
      bottomNavigationBar: NavigationBar(
        destinations: appBarDestinations,
        selectedIndex: tab,
        onDestinationSelected: (int index) {
          setState(() {
            tab = index;
          });
        }
      ),
    );
  }
}