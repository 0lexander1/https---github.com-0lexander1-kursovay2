import 'package:flutter/material.dart';
import 'package:flutter_application_1/page/fifth_page.dart';
import 'package:flutter_application_1/page/home_page.dart';
import 'package:flutter_application_1/page/profile_page.dart';
import 'package:flutter_application_1/page/six_page.dart';
import 'package:flutter_application_1/page/statia1_page.dart';
import 'package:flutter_application_1/page/statia2_page.dart';
import 'package:flutter_application_1/page/statia3_page.dart';
import 'package:flutter_application_1/page/statia4_page.dart';
import 'package:flutter_application_1/page/statia5_page.dart';
import 'package:flutter_application_1/page/statia6_page.dart';
import '../widget/list_item.dart';
import 'package:flutter_application_1/page/uslugi_page.dart';

class FourthScreen extends StatefulWidget {

  @override
  _FourthScreenState createState() => _FourthScreenState();
}

  class _FourthScreenState extends State<FourthScreen> {
  TextEditingController _searchController = TextEditingController();
  String _searchText = '';

  int _selectedIndex = 1;
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
                      height: 200,
                      width: 335,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              'assets/cobaka5.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            top: 10, // Расположение по вертикали в верхнем углу контейнера
                            left: 8, // Расположение по горизонтали в левом углу контейнера
                            child: Text(
                              'Терапия',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
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
                      height: 200,
                      width: 335,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              'assets/cat6.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            top: 10, // Расположение по вертикали в верхнем углу контейнера
                            left: 8, // Расположение по горизонтали в левом углу контейнера
                            child: Text(
                              'Лаборатория',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
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
                        height: 200,
                        width: 335,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                'assets/cobaka2.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              top: 10, // Расположение по вертикали в верхнем углу контейнера
                              left: 8, // Расположение по горизонтали в левом углу контейнера
                              child: Text(
                                'Стационар',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
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
                        height: 200,
                        width: 335,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                'assets/cat9.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              top: 10, // Расположение по вертикали в верхнем углу контейнера
                              left: 8, // Расположение по горизонтали в левом углу контейнера
                              child: Text(
                                'Груминг',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
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
                        height: 200,
                        width: 335,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                'assets/cobaka10.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              top: 10, // Расположение по вертикали в верхнем углу контейнера
                              left: 8, // Расположение по горизонтали в левом углу контейнера
                              child: Text(
                                'Стоматология',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
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
                        height: 200,
                        width: 335,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                'assets/cat10.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              top: 10, // Расположение по вертикали в верхнем углу контейнера
                              left: 8, // Расположение по горизонтали в левом углу контейнера
                              child: Text(
                                'Хирургия',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
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
                        height: 200,
                        width: 335,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                'assets/cobaka11.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              top: 10, // Расположение по вертикали в верхнем углу контейнера
                              left: 8, // Расположение по горизонтали в левом углу контейнера
                              child: Text(
                                'Вакцинация',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
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
      type: BottomNavigationBarType.fixed, // Фиксированные позиции элементов
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
      currentIndex: _selectedIndex, // Указываем текущий активный элемент
      onTap: (int index) {
        setState(() {
          _selectedIndex = index; // Устанавливаем выбранный индекс по нажатию
          if (index == 0) {
            // Обработка нажатия на "Главная"
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ThirdScreen()),
            );
          } else if (index == 1) {
            // Обработка нажатия на "Услуги"
            // Дополнительные действия, если необходимо
          } else if (index == 2) {
            // Обработка нажатия на "Рядом"
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SixScreen()),
            );
          } else if (index == 3) {
            // Обработка нажатия на "Профиль"
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfileScreen()),
            );
          }
        });
      },
      selectedLabelStyle: TextStyle(fontSize: 12), // Уменьшаем размер текста выбранного элемента
      unselectedLabelStyle: TextStyle(fontSize: 12), // Уменьшаем размер текста не выбранного элемента
      showUnselectedLabels: true, // Показывать текст для невыбранных элементов
    ),
    );
  }
}
