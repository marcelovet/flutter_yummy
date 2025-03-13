import 'package:flutter/material.dart';
import 'constants.dart';
import 'components/theme_button.dart';
import 'components/color_button.dart';

class Home extends StatefulWidget {
  final void Function(bool useLightMode) changeTheme;
  final void Function(int value) changeColor;
  final ColorSelection colorSelected;
  
  const Home({
    super.key,
    required this.changeTheme,
    required this.changeColor,
    required this.colorSelected,
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
    // TODO: define pages
    final pages = [
      // TODO: replace with category card
      Container(color: Colors.red,),
      // TODO: replace with post card
      Container(color: Colors.green,),
      // TODO: replace with restaurant landscape card
      Container(color: Colors.blue,),
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