import 'package:flutter/material.dart';
import 'package:flutter_application_1/page/fourth_page.dart';
import 'package:flutter_application_1/page/profile_page.dart';
import 'package:flutter_application_1/page/third_page.dart';

int _selectedIndex = 0; // Установим начальный индекс нижней навигационной панели
class SixScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Six Screen'),
      ),
      body: Center(
        child: Text(
          'Это страница SixScreen',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
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
      currentIndex: 2, // Указываем текущий активный элемент
  onTap: (int index) {
    switch (index) {
      case 0:
        // Обработка нажатия на "Главная"
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ThirdScreen()),
        );
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
