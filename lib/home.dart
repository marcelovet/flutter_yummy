import 'package:flutter/material.dart';
import 'package:yummy/models/cart_manager.dart';
import 'package:yummy/models/order_manager.dart';
import 'package:yummy/screens/myorders_page.dart';
import 'constants.dart';
import 'components/theme_button.dart';
import 'components/color_button.dart';
import 'screens/explore_page.dart';

class Home extends StatefulWidget {
  final void Function(bool useLightMode) changeTheme;
  final void Function(int value) changeColor;
  final ColorSelection colorSelected;
  final String appTitle;
  final CartManager cartManager;
  final OrderManager orderManager;
  
  const Home({
    super.key,
    required this.changeTheme,
    required this.changeColor,
    required this.colorSelected,
    required this.appTitle,
    required this.cartManager,
    required this.orderManager,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int tab = 0;
  List<NavigationDestination> appBarDestinations = const [
    NavigationDestination(
      icon: Icon(Icons.home_outlined),
      label: 'Explore',
      selectedIcon: Icon(Icons.home),
    ),
    NavigationDestination(
      icon: Icon(Icons.list_outlined),
      label: 'Orders',
      selectedIcon: Icon(Icons.list),
    ),
    NavigationDestination(
      icon: Icon(Icons.person_2_outlined),
      label: 'Account',
      selectedIcon: Icon(Icons.person),
    )
  ];
  
  @override
  Widget build(BuildContext context) {
    final pages = [
      ExplorePage(
        cartManager: widget.cartManager,
        orderManager: widget.orderManager,
      ),
      MyordersPage(orderManager: widget.orderManager),
      // TODO: Replace with Account Page
      const Center(
        child: Text(
          'Account Page',
          style: TextStyle(fontSize: 32.0),
        ),
      ),
    ];
    
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.appTitle),
        actions: <Widget>[
          ThemeButton(changeThemeMode: widget.changeTheme),
          ColorButton(changeColor: widget.changeColor, colorSelected: widget.colorSelected),
        ],
        elevation: 4.0,
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
      body: IndexedStack(
        index: tab,
        children: pages,
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