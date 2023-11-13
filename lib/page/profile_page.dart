import 'package:flutter/material.dart';
import 'package:flutter_application_1/page/fourth_page.dart';
import 'package:flutter_application_1/page/help_page.dart';
import 'package:flutter_application_1/page/history_page.dart';
import 'package:flutter_application_1/page/home_page.dart';
import 'package:flutter_application_1/page/petinformation_page.dart';
import 'package:flutter_application_1/page/six_page.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? _image;

  final picker = ImagePicker();

  Future<void> getImage() async {
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  int _selectedIndex = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 70,
            left: 0,
            right: 0,
            bottom: 50,
            child: Align(
              alignment: Alignment.topCenter,
              child: _image == null
                  ? Container(
                      width: 182,
                      height: 195,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: _image != null
                            ? DecorationImage(
                                image: FileImage(_image!),
                                fit: BoxFit.cover,
                              )
                            : DecorationImage(
                                image: AssetImage('assets/catprofile.jpg'),
                                fit: BoxFit.cover,
                              ),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.camera_alt),
                        onPressed: getImage,
                      ),
                    )
                  : GestureDetector(
                      onTap: getImage,
                      child: Container(
                        width: 182,
                        height: 195,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: FileImage(_image!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
            ),
          ),
          Positioned(
            top: 300, // Примерная вертикальная позиция контейнеров с информацией о пользователе
            left: 0,
            right: 0,
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HistoryScreen()),
                    );
                  },
                  child: Container(
                    height: 44,
                    width: 335,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.access_time),  
                        SizedBox(width: 8),
                        Text(
                          'История посещений',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Spacer(),
                        Icon(Icons.arrow_forward, color: Color(0xFF1A6FEE)),  
                      ],
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 16),
                  ),
                ),
                SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PetInformationScreen()),
                    );
                  },
                  child: Container(
                    height: 44,
                    width: 335,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.error_outline),  
                        SizedBox(width: 8),
                        Text(
                          'Информация о питомце',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Spacer(),
                        Icon(Icons.arrow_forward, color: Color(0xFF1A6FEE)),  
                      ],
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 16),
                  ),
                ),
                SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HelpScreen()),
                    );
                  },
                  child: Container(
                    height: 44,
                    width: 335,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.help_outline),  
                        SizedBox(width: 8),
                        Text(
                          'Помощь',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Spacer(),
                        Icon(Icons.arrow_forward, color: Color(0xFF1A6FEE)),  
                      ],
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 16),
                  ),
                )
              ],
            ),
          ),
        ],
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
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FourthScreen()),
            );
          } else if (index == 2) {
            // Обработка нажатия на "Рядом"
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SixScreen()),
            );
          } else if (index == 3) {
            // Обработка нажатия на "Профиль"
            
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