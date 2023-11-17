import 'package:flutter/material.dart';
import 'package:flutter_application_1/page/statia1_page.dart';
import 'package:flutter_application_1/page/usluga1.dart';

class UslugaTerapiaScreen extends StatefulWidget {
  @override
  _UslugaTerapiaState createState() => _UslugaTerapiaState();
}

class _UslugaTerapiaState extends State<UslugaTerapiaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Терапия',
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
      body: ListView(
        children: [
          // Контейнер для "Консультация ветеринара"
          Container(
            margin: EdgeInsets.all(8),
            height: 52,
            decoration: BoxDecoration(
              color: Color(0xff1a6fee),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UslugaTerapia1Screen()),
                );
              },
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      'Консультация ветеринара',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),

          // Контейнер для "Вакцинация"
          Container(
            margin: EdgeInsets.all(8),
            height: 52,
            decoration: BoxDecoration(
              color: Color(0xff1a6fee),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Statia1Screen()),
                );
              },
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      'Вакцинация',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),

          Container(
            margin: EdgeInsets.all(8),
            height: 52,
            decoration: BoxDecoration(
              color: Color(0xff1a6fee),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Statia1Screen()),
                );
              },
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      'Соскоб с кожи',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(8),
            height: 52,
            decoration: BoxDecoration(
              color: Color(0xff1a6fee),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Statia1Screen()),
                );
              },
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      'Взятие анализов',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(8),
            height: 52,
            decoration: BoxDecoration(
              color: Color(0xff1a6fee),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Statia1Screen()),
                );
              },
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      'Общий анализ крови',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(8),
            height: 52,
            decoration: BoxDecoration(
              color: Color(0xff1a6fee),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Statia1Screen()),
                );
              },
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      'Мышечные инъекции',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(8),
            height: 52,
            decoration: BoxDecoration(
              color: Color(0xff1a6fee),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Statia1Screen()),
                );
              },
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      'Ифнузионная терапия',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(8),
            height: 52,
            decoration: BoxDecoration(
              color: Color(0xff1a6fee),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Statia1Screen()),
                );
              },
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      'Мазок',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
