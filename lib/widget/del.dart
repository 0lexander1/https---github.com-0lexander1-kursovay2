import 'package:flutter/material.dart';

class DeleteButton extends StatelessWidget {
  final TextEditingController controller;

  DeleteButton({required this.controller});

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        // Удаляем последний символ из текстового поля
        final text = controller.text;
        if (text.isNotEmpty) {
          controller.text = text.substring(0, text.length - 1);
        }
      },
      child: Container(
       width: screenWidth * 0.08,
       height: screenHeight * 0.04,
       decoration: BoxDecoration(color: Colors.white,),
      child: Image.asset("assets/images/del.jpg", fit: BoxFit.fill,),
      ),
    );
  }
}
