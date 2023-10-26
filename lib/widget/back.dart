import 'package:flutter/material.dart';


class Back extends StatelessWidget {
  final double width;
  final double height; 
  final Widget Function(BuildContext) page;


  const Back({required this.width, required this.height, required this.page});

  @override
  Widget build(BuildContext context) {
    // Вычисляем ширину прямоугольника
    double screenWidth = MediaQuery.of(context).size.width;
    double rectangleWidth = screenWidth * width; 
    // Вычисляем высоту прямоугольника
    double screenHeight = MediaQuery.of(context).size.height;
    double rectangleHeight = screenHeight * height;


   
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: page, 
          ),
        );
        },
       
       style:  ElevatedButton.styleFrom(
       minimumSize: Size(rectangleWidth, rectangleHeight),
       backgroundColor: Colors.white,
      ),
      child: Image.asset("assets/images/Back.jpg", fit: BoxFit.fill,),
    );
  }
}