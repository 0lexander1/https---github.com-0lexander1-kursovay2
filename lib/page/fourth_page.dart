import 'package:flutter/material.dart';
import 'package:flutter_application_1/widget/text_place.dart';

class FourthScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextPlace(
                      txt: "jj", 
                      size: 24,
                      st: FontWeight.bold,
                      backgroundColor: const Color.fromARGB(0, 255, 255, 255),
                      colortxt: Colors.green,
                      width: 0.7,
                      align: TextAlign.center,
                      height: 0.06,
                    ),
                  ],
                  )
              ]
            ),
          ),
        ),
      ),
    );
  }
}