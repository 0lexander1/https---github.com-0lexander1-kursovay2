import 'package:flutter/material.dart';

class CircleButton extends StatefulWidget {
  final String number;
  final TextEditingController controller;

  CircleButton(this.number, {required this.controller});

  @override
  _CircleButtonState createState() => _CircleButtonState();
}

class _CircleButtonState extends State<CircleButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double size = 0;

    if (screenWidth > screenHeight) {
      size = screenHeight;
    } else {
      size = screenWidth;
    }

    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          isPressed = true;
        });
        // Добавляем номер кнопки к тексту в поле
        widget.controller.text += widget.number;
      },
      onTapUp: (_) {
        setState(() {
          isPressed = false;
        });
      },
      child: CircleAvatar(
        radius: size * 0.12,
        backgroundColor: isPressed ? Colors.blue : const Color.fromARGB(156, 233, 229, 229),
        child: Text(
          widget.number,
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}