import 'package:flutter/material.dart';
import 'package:yummy/models/models.dart';
import 'package:yummy/screens/screens.dart';
import 'package:yummy/components/components.dart';
import 'constants.dart';

class Home extends StatefulWidget {
  final void Function(bool useLightMode) changeTheme;
  final void Function(int value) changeColor;
  final ColorSelection colorSelected;
  final String appTitle;
  final CartManager cartManager;
  final OrderManager orderManager;
  final YummyAuth auth;
  final int tab;
  
  const Home({
    super.key,
    required this.changeTheme,
    required this.changeColor,
    required this.colorSelected,
    required this.appTitle,
    required this.cartManager,
    required this.orderManager,
    required this.auth,
    required this.tab,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
      AccountPage(
        user: User(
          firstName: 'John',
          lastName: "Doe",
          role: 'Flutteristas',
          profileImageUrl: 'assets/profile_pics/person_stef.jpeg',
          points: 100,
          darkMode: true
        ),
        onLogOut: (logout) async {
          // TODO: Logout and go to login
        }
      ),
    ];
    
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.appTitle),
        actions: <Widget>[
          ThemeButton(changeThemeMode: widget.changeTheme),
          ColorButton(changeColor: widget.changeColor, colorSelected: widget.colorSelected),
        ],
        elevation: 0.0,
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
      body: IndexedStack(
        index: widget.tab,
        children: pages,
      ),
      bottomNavigationBar: NavigationBar(
        destinations: appBarDestinations,
        selectedIndex: widget.tab,
        onDestinationSelected: (index) {
          // TODO: Navigate to specific tab
        }
      ),
    );
  }
}