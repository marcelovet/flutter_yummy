import 'package:flutter/material.dart';
import 'constants.dart';
import 'components/theme_button.dart';
import 'components/color_button.dart';

void main() {
  runApp(const Yummy());
}

class Yummy extends StatefulWidget {

  const Yummy({super.key});

  @override
  State<Yummy> createState() => _YummyState();
}

class _YummyState extends State<Yummy> {
  ThemeMode themeMode = ThemeMode.light;
  ColorSelection colorSelected = ColorSelection.pink;

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

    return MaterialApp(
      title: appTitle,
      // debugShowCheckedModeBanner: false,
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
      // replace Scaffold with Home widget
      home: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            ThemeButton(changeThemeMode: changeThemeMode),
            ColorButton(changeColor: changeColor, colorSelected: colorSelected),
          ],
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