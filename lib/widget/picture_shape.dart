import 'package:flutter/material.dart';

class PictureShape extends StatelessWidget {
  final double width;
  final double height; 

  const PictureShape({required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    // Вычисляем ширину прямоугольника
    double screenWidth = MediaQuery.of(context).size.width;
    double rectangleWidth = screenWidth * width; 
    // Вычисляем высоту прямоугольника
    double screenHeight = MediaQuery.of(context).size.height;
    double rectangleHeight = screenHeight * height;

  
    return Container(
      width: rectangleWidth,
      height: rectangleHeight,
         decoration: BoxDecoration(
         color: const Color.fromARGB(0, 156, 215, 228), 
         borderRadius: BorderRadius.circular(10),
       ),
       
       child: Align(alignment: Alignment.centerRight,
         child: Image.asset("assets/images/shape.jpg", fit: BoxFit.contain,)
    )
    );
  }
}