import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yummy/models/models.dart';
import 'package:yummy/screens/screens.dart';
import 'constants.dart';
import 'home.dart';

void main() {
  runApp(const Yummy());
}

/// Allows the ability to scroll by dragging with touch, mouse, and trackpad.
class CustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad
      };
}

class Yummy extends StatefulWidget {

  const Yummy({super.key});

  @override
  State<Yummy> createState() => _YummyState();
}

class _YummyState extends State<Yummy> {
  ThemeMode themeMode = ThemeMode.light;
  ColorSelection colorSelected = ColorSelection.pink;
  /// Authentication to manage user login session
  // ignore: unused_field
  final YummyAuth _auth = YummyAuth();
  /// Manage user's shopping cart for the items they order.
  final CartManager _cartManager = CartManager();
  /// Manage user's orders submitted
  final OrderManager _orderManager = OrderManager();
  late final _router = GoRouter(
    initialLocation: '/login',
    // TODO: Add Redirect Handler
    routes: [
      // TODO: Add login route
      // TODO: Add home route
    ],
    // TODO: Add error handler
  );
  
  // TODO: Add Redirect Handler

  void changeThemeMode(bool useLightMode) {
    setState(() {
      themeMode = useLightMode ? ThemeMode.light : ThemeMode.dark;
    });
  }
  void changeColor(int value) {
    setState(() {
      colorSelected = ColorSelection.values[value];
    });
  }

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'Yummy';
    // TODO: Replace with Router
    return MaterialApp(
      title: appTitle,
      debugShowCheckedModeBanner: false,
      scrollBehavior: CustomScrollBehavior(),
      themeMode: themeMode,
      theme: ThemeData(
        colorSchemeSeed: colorSelected.color,
        useMaterial3: true,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        colorSchemeSeed: colorSelected.color,
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      home: LoginPage(onLogIn: (credentials) {}),
    );
  }
}