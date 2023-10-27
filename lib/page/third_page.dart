import 'package:flutter/material.dart';
import 'package:flutter_application_1/page/fourth_page.dart';
import 'package:flutter_application_1/widget/button_text.dart';
import 'package:flutter_application_1/widget/text_place.dart';
import 'package:flutter_application_1/widget/password.dart';
import 'package:flutter_application_1/widget/del.dart';

class SixthScreen extends StatefulWidget {
  @override
  _SixthScreenState createState() => _SixthScreenState();
}

class _SixthScreenState extends State<SixthScreen> {
  List<String> codeList = List.filled(4, '');
  TextEditingController _codeController = TextEditingController();

 void updateCircles() {
    for (int i = 0; i < codeList.length; i++) {
      codeList[i] = i < _codeController.text.length
          ? _codeController.text[i]
          : ''; // Записываем соответствующую цифру или пустую строку
    }
    setState(() {});
    if (_codeController.text.length == 4) {
      // Если введен четырёхзначный код, переходим на следующую страницу
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => FourthScreen()),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _codeController.addListener(() {
      updateCircles();
    });
  }

  @override
    void dispose() {
    _codeController.dispose();
    super.dispose();
  }
  final String butSkip = "Пропустить";
  
  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ButtonText(
                      page: (context) => FourthScreen(),
                      txt: butSkip, 
                      width: 0.4,
                      height: 0.1, 
                      backgroundColor: const Color.fromARGB(0, 255, 255, 255), 
                      colortxt: Colors.blue
                    )
                  ]
                ),
                SizedBox(height: screenHeight * 0.02,),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextPlace(
                      txt: "Создайте пароль",
                      align: TextAlign.center,
                      st: FontWeight.bold,
                      width: 0.8,
                      height: 0.06,
                      backgroundColor: const Color.fromARGB(0, 255, 255, 255), 
                      colortxt: Colors.black, 
                      size: 32)
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextPlace(
                      txt: "Для защиты ваших персональных данных",
                      align: TextAlign.center,
                      st: FontWeight.normal,
                      width: 0.8,
                      height: 0.06,
                      backgroundColor: const Color.fromARGB(0, 255, 255, 255), 
                      colortxt: Colors.grey, 
                      size: 16)
                  ],
                ),
                SizedBox(height: screenHeight * 0.06,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: codeList.map((code) {
                    return Container(
                      width: 10.0,
                      height: 10.0,
                      margin: EdgeInsets.symmetric(horizontal: 4.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: code.isNotEmpty ? Colors.blue : Colors.grey,
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(height: screenHeight * 0.08,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleButton("1", controller:  _codeController),
                    SizedBox(width: screenWidth * 0.015,),
                    CircleButton("2", controller: _codeController),
                    SizedBox(width: screenWidth * 0.015,),
                    CircleButton("3", controller: _codeController)
                  ],
                ),
                SizedBox(height: screenHeight * 0.01,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleButton("4", controller: _codeController),
                    SizedBox(width: screenWidth * 0.015,),
                    CircleButton("5", controller: _codeController),
                    SizedBox(width: screenWidth * 0.015,),
                    CircleButton("6", controller: _codeController)
                  ],
                ),
                SizedBox(height: screenHeight * 0.01,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleButton("7", controller: _codeController),
                    SizedBox(width: screenWidth * 0.015,),
                    CircleButton("8", controller: _codeController),
                    SizedBox(width: screenWidth * 0.015,),
                    CircleButton("9", controller: _codeController)
                  ],
                ),
                SizedBox(height: screenHeight * 0.01,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: screenWidth * 0.167,),
                    CircleButton("0", controller: _codeController),
                    SizedBox(width: screenWidth * 0.08,),
                    DeleteButton(controller: _codeController)
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}