import 'package:flutter/material.dart';

class ButtonEntr extends StatelessWidget {
  final Color backgroundColor;
  final double width;
  final double height; 
  final bool isEnabled;
  final VoidCallback? check;

  const ButtonEntr({
    required this.isEnabled,
    required this.check,
    required this.width,
    required this.height,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    // Не забудьте вычислить прямоугольник, если он всё ещё нужен

    return IconButton(
      onPressed: isEnabled ? () {
        check?.call();
      } : null,
      icon: Icon(Icons.save, color: backgroundColor), // Вместо Icons.save может быть другая иконка из Material Design Icons
      iconSize: 50, // Размер иконки
    );
  }
}
