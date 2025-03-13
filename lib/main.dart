import 'package:flutter/material.dart';
import 'constants.dart';

void main() {
  runApp(Yummy());
}

class Yummy extends StatelessWidget {
  ThemeMode themeMode = ThemeMode.light;
  ColorSelection colorSelected = ColorSelection.pink;
  
  Yummy({super.key});

  // TODO: add changeTheme

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'Yummy';

    // TODO: setup theme
    return MaterialApp(
      title: appTitle,
      // debugShowCheckedModeBanner: false,
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
      // replace Scaffold with Home widget
      home: Scaffold(
        appBar: AppBar(
          // TODO: add action buttons
          elevation: 4.0,
          title: Text(
            appTitle,
            style: const TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Center(
          child: Text(
            "You hungry?\u{1f60b}",
            style: const TextStyle(
              fontSize: 24.0,
            ),
          ),
        ),
      ),
    );
  }
}