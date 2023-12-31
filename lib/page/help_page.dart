import 'package:flutter/material.dart';

class HelpScreen extends StatefulWidget {
  @override
  _HelpScreenState createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Помощь',
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.blue,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 60), // Добавляем отступ сверху
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            width: 335,
            height: 196,
            margin: EdgeInsets.only(top: 20), // Добавляем отступ между AppBar и Container
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color.fromRGBO(192, 192, 192, 0.5),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Если у вас возникли какие-либо вопросы к работе приложения или предложения по улучшению обслуживанию клиентов, вы можете написать нам на почту sfgdsfdsfsd@mail.ru или позвонить на горячую линию +7(657)476-54-76',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
