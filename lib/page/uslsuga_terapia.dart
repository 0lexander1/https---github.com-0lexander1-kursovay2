import 'package:flutter/material.dart';

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
      
    );
  }
}
