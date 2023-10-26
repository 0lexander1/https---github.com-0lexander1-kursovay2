import 'package:flutter/material.dart';
import 'dart:async';

class TimerText extends StatefulWidget {
  @override
  _TimerTextState createState() => _TimerTextState();
}

class _TimerTextState extends State<TimerText> {
  int seconds = 60;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      setState(() {
        seconds--;
        if (seconds == 0) 
        {
          timer.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
              
      width: screenWidth * 0.8,
      height: screenHeight * 0.1,
      child: Text(
        'Отправить код повторно можно будет через $seconds секунд',
        style: const TextStyle(fontSize: 16.0, color: Colors.grey),
        textAlign: TextAlign.center,
      ),
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}