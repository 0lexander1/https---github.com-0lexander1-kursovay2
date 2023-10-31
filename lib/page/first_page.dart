import 'package:flutter/material.dart';
import 'package:flutter_application_1/widget/button.dart';
import 'package:flutter_application_1/widget/text_place.dart';
import 'package:flutter_application_1/widget/field.dart';
import 'package:flutter_application_1/page/second_page.dart';


class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  TextEditingController _emailController = TextEditingController();
  bool _isButtonEnabled = false;


  @override
    void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: EdgeInsets.only(top: 95, bottom: 90, left: 10, right: 10),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        "Добро пожаловать!",
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                SizedBox(height: screenHeight * 0.05,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Field(
                      width: 0.8, 
                      labtext: "Вход по E-mail",
                      height: 0.1, 
                      colortxt: Colors.black45, 
                      mode: false, 
                      hinttxt: "example@mail.ru",
                      onChange: (value) {
                        setState(() {
                          _isButtonEnabled = value.isNotEmpty;
                        });
                      },
                      controller: _emailController,
                    )
                  ],
                ),
                SizedBox(height: screenHeight * 0.02,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ButtonPush(
                      isEnabled: _isButtonEnabled ,
                      size: 16,
                      txt: "Далее", 
                      page: (context) => SecondScreen(),
                      colortxt: const Color.fromARGB(255, 255, 255, 255), 
                      width: 0.8, 
                      height: 0.09, 
                      backgroundColor: _isButtonEnabled
                          ? const Color.fromARGB(255,26,111,238) // Цвет активной кнопки
                          : const Color.fromARGB(255, 13, 33, 105),
                      )
                   ],
                ),
                SizedBox(height:  screenHeight * 0.25,),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextPlace(
                      txt: "Или войдите с помощью",
                      backgroundColor: Colors.white,
                      width: 0.8,
                      align: TextAlign.center,
                      height: 0.05,
                      colortxt: Colors.grey,
                      size: 16,
                      st: FontWeight.normal,
                    )
                  ]
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ButtonPush(
                      isEnabled: true,
                      size: 24,
                      page: (context) => FirstScreen(),
                      backgroundColor: Colors.white,
                      width: 0.8,
                      height: 0.1,
                      colortxt: Colors.black,
                      txt: "Войти с Яндекс",
                    )
                  ]
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
