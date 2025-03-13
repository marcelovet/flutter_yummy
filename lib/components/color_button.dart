import 'package:flutter/material.dart';
import '../constants.dart';

class ColorButton extends StatelessWidget {
  final void Function(int) changeColor;
  final ColorSelection colorSelected;
  
  const ColorButton({
    super.key,
    required this.changeColor,
    required this.colorSelected,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      onSelected: changeColor,
      icon: Icon(
        Icons.opacity_outlined,
        color: Theme.of(context).colorScheme.onSurfaceVariant,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      itemBuilder: (context) {
        return List.generate(
          ColorSelection.values.length,
          (index) {
            final currentColor = ColorSelection.values[index];
            return PopupMenuItem(
              value: index,
              enabled: currentColor != colorSelected,
              child: Wrap(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Icon(
                      Icons.opacity_outlined,
                      color: currentColor.color,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      currentColor.label,
                    ),
                  ),
                ],
              ),
            );
          }
        );
      },
    );
  }
}