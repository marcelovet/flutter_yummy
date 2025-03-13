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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          ThemeButton(changeThemeMode: widget.changeTheme),
          ColorButton(changeColor: widget.changeColor, colorSelected: widget.colorSelected),
        ],
        elevation: 4.0,
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
      // TODO: Switch between pages
      body: Center(
        child: Text(
          "You hungry?\u{1f60b}",
          style: const TextStyle(
            fontSize: 24.0,
          ),
        ),
      ),
      // TODO: add navigation bar
    );
  }
}