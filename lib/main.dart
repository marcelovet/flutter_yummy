import 'package:flutter/material.dart';

void main() {
  runApp(const Yummy());
}

class Yummy extends StatelessWidget {
  // TODO: setup defaul theme
  
  const Yummy({super.key});

  // TODO: add changeTheme

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'Yummy';

    // TODO: setup theme
    return MaterialApp(
      title: appTitle,
      // debugShowCheckedModeBanner: false,
      // TODO: add theme
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