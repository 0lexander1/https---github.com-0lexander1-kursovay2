import 'package:flutter/material.dart';

class HistoryScreen extends StatefulWidget {
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // Разрешаем содержимому пройти за апп бар
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Делаем фон апп бара полностью прозрачным
        elevation: 0, // Убираем тень апп бара
        title: Text(
          'История посещений',
          style: TextStyle(
            fontSize: 20,
            color: Colors.black, // Задаем цвет текста
          ),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.blue, // Задаем цвет иконки назад
        ),
      ),
      


    );
  }
}
