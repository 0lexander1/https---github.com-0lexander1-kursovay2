import 'package:flutter/material.dart';
import 'package:flutter_application_1/page/fifth_page.dart';
import 'package:flutter_application_1/page/profile_page.dart';
import 'package:flutter_application_1/page/six_page.dart';
import 'package:flutter_application_1/page/statia1_page.dart';
import 'package:flutter_application_1/page/statia2_page.dart';
import 'package:flutter_application_1/page/statia3_page.dart';
import 'package:flutter_application_1/page/statia4_page.dart';
import 'package:flutter_application_1/page/statia5_page.dart';
import 'package:flutter_application_1/page/statia6_page.dart';
import '../widget/list_item.dart';
import 'package:flutter_application_1/page/fourth_page.dart';


class ThirdScreen extends StatefulWidget {
  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}

  class _ThirdScreenState extends State<ThirdScreen> {
  TextEditingController _searchController = TextEditingController();
  String _searchText = '';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SafeArea(
        child: Column(
          children: [
        
            SizedBox(height: 15),
            Container(
            height: 38,
            width: 350,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.3), // Полупрозрачный серый цвет
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                SizedBox(width: 8), // Добавим небольшое пространство слева
                Icon(
                  Icons.search,
                  color: Color(0xFF1A6FEE), // Цвет значка поиска
                ),// Иконка поиска слева
                SizedBox(width: 8), // Еще небольшое пространство между иконкой и текстовым полем
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    onChanged: (value) {
                      setState(() {
                        _searchText = value;
                        if (_searchText.toLowerCase() == 'собака боится воды') {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Statia1Screen()),
                                );
                              } else if (_searchText.toLowerCase() == 'почему кошки много спят') {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Statia2Screen()),
                                );
                              } else if (_searchText.toLowerCase() == 'правильное питание для собак') {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Statia3Screen()),
                                );
                              } else if (_searchText.toLowerCase() == 'правильное питание для кошек') {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Statia4Screen()),
                                );
                              } else if (_searchText.toLowerCase() == 'обучение щенков') {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Statia5Screen()),
                                );
                              } else if (_searchText.toLowerCase() == 'уникальные особенности кошек') {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Statia6Screen()),
                                );
                              }
                            }); 
                          }, 
                    decoration: InputDecoration(
                      hintText: 'Поиск',
                      border: InputBorder.none, // Удаление границы у текстового поля
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.clear),
                  color: Color(0xFF1A6FEE),
                  onPressed: () {
                    setState(() {
                      _searchText = '';
                      _searchController.clear();
                    });
                  },
                ),
                SizedBox(width: 8), // Добавим небольшое пространство справа
              ],
            ),
          ),
          SizedBox(height: 16), // Небольшой промежуток перед изображениями
    SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Statia2Screen()),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Container(
                height: 152,
                width: 344,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage('assets/cobaka2.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Statia2Screen()),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Container(
                height: 152,
                width: 344,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage('assets/cobaka3.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
            Container(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Text(
                    'Услуги',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0), // Цвет надписи
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FourthScreen()),
                      );
                    },
                    child: Row(
                      children: [
                        Text(
                          'Смотреть все',
                          style: TextStyle(
                            color: Color(0xFF1A6FEE), // Цвет текста
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward,
                          color: Color(0xFF1A6FEE), // Цвет стрелки
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    // Действие при нажатии на изображение
                    // Например, переход на следующую страницу
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FourthScreen()),
                    );
                  },
                  child: Stack(
                    children: [
                      Container(
                        height: 90,
                        width: 100,
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage('assets/cobaka5.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 5,
                        bottom: 10,
                        child: Opacity(
                          opacity: 0.5,
                          child: Container(
                            height: 16,
                            width: 88,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                'Терапия',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Добавьте аналогичный блок для остальных GestureDetector
                GestureDetector(
                  onTap: () {
                    // Действие при нажатии на изображение
                    // Например, переход на следующую страницу
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FourthScreen()),
                    );
                  },
                  child: Stack(
                    children: [
                      Container(
                        height: 90,
                        width: 100,
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage('assets/cat3.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 5,
                        bottom: 10,
                        child: Opacity(
                          opacity: 0.5,
                          child: Container(
                            height: 16,
                            width: 88,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                'Груминг',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Действие при нажатии на изображение
                    // Например, переход на следующую страницу
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FourthScreen()),
                    );
                  },
                  child: Stack(
                    children: [
                      Container(
                        height: 90,
                        width: 100,
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage('assets/cobaka2.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 5,
                        
                        bottom: 10,
                        child: Opacity(
                          opacity: 0.5,
                          child: Container(
                            height: 16,
                            width: 88,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                'Стационар',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Text(
                    'Интересные статьи',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0), // Цвет надписи
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FifthScreen()),
                      );
                    },
                    child: Row(
                      children: [
                        Text(
                          'Смотреть все',
                          style: TextStyle(
                            color: Color(0xFF1A6FEE), // Цвет текста
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward,
                          color: Color(0xFF1A6FEE), // Цвет стрелки
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  GestureDetector(
                  onTap: () {
                    // Действие при нажатии на изображение
                    // Например, переход на следующую страницу
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Statia5Screen()),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Container(
                      height: 126,
                      width: 156,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'assets/cobaka9.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            top: 10, // Расположение по вертикали в верхнем углу контейнера
                            left: 8, // Расположение по горизонтали в левом углу контейнера
                            child: Text(
                              'Обучение щенков',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                  SizedBox(height: 16), // Промежуток между контейнерами
                  GestureDetector(
                  onTap: () {
                    // Действие при нажатии на изображение
                    // Например, переход на следующую страницу
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Statia1Screen()),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Container(
                      height: 126,
                      width: 156,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'assets/cobaka4.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            top: 10, // Расположение по вертикали в верхнем углу контейнера
                            left: 8, // Расположение по горизонтали в левом углу контейнера
                            child: Text(
                              'Собака боится воды',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                  GestureDetector(
                    onTap: () {
                      // Действие при нажатии на изображение
                      // Например, переход на следующую страницу
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Statia2Screen()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Container(
                        height: 126,
                        width: 156,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                'assets/cat.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              top: 10, // Расположение по вертикали в верхнем углу контейнера
                              left: 8, // Расположение по горизонтали в левом углу контейнера
                              child: Text(
                                'Почему кошки много спят?',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),


          ],
        ),
      ),
      
      bottomNavigationBar: BottomNavigationBar(
  items: <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Главная',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.list),
      label: 'Услуги',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.location_on),
      label: 'Рядом',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: 'Профиль',
    ),
  ],
  unselectedItemColor: const Color(0xFFAAAAAA), // Цвет неактивных элементов
  selectedItemColor: const Color(0xFF1A6FEE), // Цвет активного элемента
  onTap: (int index) {
    switch (index) {
      case 0:
        // Обработка нажатия на "Главная"
        // Можно добавить соответствующий код здесь
        break;
      case 1:
        // Обработка нажатия на "Услуги"
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FourthScreen()),
        );
        break;
      case 2:
        // Обработка нажатия на "Рядом"
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SixScreen()),
        );
        break;
      case 3:
        // Обработка нажатия на "Профиль"
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfileScreen()),
        );
        break;
    }
  },
),

    );
  }
}