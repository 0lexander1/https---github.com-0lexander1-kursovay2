import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class PetInformationScreen extends StatefulWidget {
  @override
  _PetInformationScreenState createState() => _PetInformationScreenState();
}

class _PetInformationScreenState extends State<PetInformationScreen> {
  File? _image;
  TextEditingController _nameController = TextEditingController(text: 'Имя Фамилия');
  String owner = 'Владелец';

  final picker = ImagePicker();
  String _petName = 'Кличка'; // Изначальное значение "Кличка"
  String _petPoroda = 'Порода';

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

  void updatePetName(String newName) {
    setState(() {
      _petName = newName; // Обновляем имя питомца
    });
  }

  void updatePetPoroda(String newPoroda) {
    setState(() {
      _petPoroda = newPoroda; // Обновляем имя питомца
    });
  }

@override
Widget build(BuildContext context) {
  return Scaffold(
    extendBodyBehindAppBar: true, // Разрешаем содержимому пройти за апп бар
        appBar: AppBar(
          backgroundColor: Colors.transparent, // Делаем фон апп бара полностью прозрачным
          elevation: 0, // Убираем тень апп бара
          title: Text(
            'Информация о питомце',
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
        
    body: Stack(
      children: [
        // Контейнер с изображением
        Positioned(
          top: 150, // Небольшой отступ от AppBar
          left: (MediaQuery.of(context).size.width - 182) / 2, // Центрируем по горизонтали
          child: Container(
            width: 182,
            height: 195,
            child: Stack(
              children: [
                // Изображение
                Container(
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
                ),
                // Контейнер с текстом "Кличка"
                Positioned(
                  bottom: 0,
                  left: (MediaQuery.of(context).size.width - 360) / 2,
                  child: GestureDetector(
                    onTap: () {
                      // При нажатии, открываем диалоговое окно для изменения имени питомца
                      showDialog(
                        context: context,
                        builder: (context) {
                          String newName = _petName; // Создаем новую переменную для ввода нового имени
                          return AlertDialog(
                            title: Text('Изменить кличку'),
                            content: TextField(
                              controller: TextEditingController(text: _petName),
                              onChanged: (value) {
                                newName = value; // Обновляем новое имя питомца при изменении
                              },
                            ),
                            actions: [
                              TextButton(
                                child: Text('Готово'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  updatePetName(newName); // Применяем измененное имя питомца
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Container(
                      height: 27,
                      width: 182,
                      child: Center(
                        child: Text(
                          _petName,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.5),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        // Кнопка для смены изображения
        Positioned(
          top: 220, // Расположение относительно верхней границы контейнера с изображением
          left: (MediaQuery.of(context).size.width - 40) / 2, // Центрируем по горизонтали
          child: IconButton(
            padding: EdgeInsets.all(0), // Убираем внутренний отступ
            icon: Icon(Icons.camera_alt),
            onPressed: getImage,
          ),
        ),
        
        Positioned(
          top: 425, // Подбирайте координаты в зависимости от вашего дизайна
          left: (MediaQuery.of(context).size.width - 360) / 2, // Центрируем по горизонтали
          child: Container(
            width: 360,
            height: 600,
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.5),
              borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
            ),
            // здесь ты можешь добавить дополнительное содержимое, если это необходимо
          ),
        ),
        ),
        // Контейнер с надписью на синем фоне
        Positioned(
          top: 450, // Смещение от верхней границы нижнего контейнера
          left: (MediaQuery.of(context).size.width - 182) / 2, // Центрируем по горизонтали
          child: GestureDetector(
            onTap: () {
              // При нажатии, открываем диалоговое окно для изменения имени питомца
              showDialog(
                context: context,
                builder: (context) {
                  String newPoroda = _petPoroda; // Создаем новую переменную для ввода нового имени
                  return AlertDialog(
                    title: Text('Порода'),
                    content: TextField(
                      controller: TextEditingController(text: _petPoroda),
                      onChanged: (value) {
                        newPoroda = value; // Обновляем новое имя питомца при изменении
                      },
                    ),
                    actions: [
                      TextButton(
                        child: Text('Готово'),
                        onPressed: () {
                          Navigator.of(context).pop();
                          updatePetPoroda(newPoroda); // Применяем измененное имя питомца
                        },
                      ),
                    ],
                  );
                },
              );
            },
            child: Container(
              width: 182,
              height: 50, // Высота контейнера
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  _petPoroda,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
        ),
        
        // Новые контейнеры
        Positioned(
          top: 525, // Подбирайте координаты в зависимости от вашего дизайна
          left: (MediaQuery.of(context).size.width - 350) / 2, // Центрируем по горизонтали
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Stack(
                children: [
                  Container( // Контейнер с цветом
                    width: 80,
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue, // Цвет или другие стилизации
                    ),
                  ),
                  Positioned( // Надпись "Возраст"
                    top: 5,
                    left: 5,
                    right: 5,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      color: Colors.transparent, // Прозрачный задний фон надписи
                      child: Text(
                        'Возраст',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Positioned( // Полупрозрачный контейнер
                    bottom: 5,
                    left: 5,
                    right: 5,
                    child: Container(
                      width: 69,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.5),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                      child: Center(
                        child: TextField(
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(width: 10), // Отступ между контейнерами
              Stack(
                children: [
                  Container( // Контейнер с цветом
                    width: 80,
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue, // Цвет или другие стилизации
                    ),
                  ),
                  Positioned( // Надпись "Возраст"
                    top: 5,
                    left: 5,
                    right: 5,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      color: Colors.transparent, // Прозрачный задний фон надписи
                      child: Text(
                        'Пол',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Positioned( // Полупрозрачный контейнер
                    bottom: 5,
                    left: 5,
                    right: 5,
                    child: Container(
                      width: 69,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.5),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                      child: Center(
                        child: TextField(
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(width: 10),
              Stack(
                children: [
                  Container( // Контейнер с цветом
                    width: 80,
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue, // Цвет или другие стилизации
                    ),
                  ),
                  Positioned( // Надпись "Возраст"
                    top: 5,
                    left: 5,
                    right: 5,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      color: Colors.transparent, // Прозрачный задний фон надписи
                      child: Text(
                        'Окрас',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Positioned( // Полупрозрачный контейнер
                    bottom: 5,
                    left: 5,
                    right: 5,
                    child: Container(
                      width: 69,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.5),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                      child: Center(
                        child: TextField(
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(width: 10),
              Stack(
                children: [
                  Container( // Контейнер с цветом
                    width: 80,
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue, // Цвет или другие стилизации
                    ),
                  ),
                  Positioned( // Надпись "Возраст"
                    top: 5,
                    left: 5,
                    right: 5,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      color: Colors.transparent, // Прозрачный задний фон надписи
                      child: Text(
                        'Вес',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Positioned( // Полупрозрачный контейнер
                    bottom: 5,
                    left: 5,
                    right: 5,
                    child: Container(
                      width: 69,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.5),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                      child: Center(
                        child: TextField(
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
      top: 620,
      left: 40,
      child: GestureDetector(
        onTap: () {
          getImage();
        },
        child: Container(
          width: 340,
          height: 80,
          decoration: BoxDecoration(
            color: Colors.blue, // заменить на ваши данные
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              bottomLeft: Radius.circular(40),
            ),
          ),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 10), // отступ слева
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: _image != null
                      ? DecorationImage(
                          image: FileImage(_image!),
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
              ),
              SizedBox(width: 10), // добавим отступ между фотографией и текстом
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  
                  children: [
                    TextField(
                      controller: _nameController,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                    Text(
                      owner,
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
              ),
              
              ),
            ],
          ),
        ),
      ),
    ),
      ],
    ),
  );
}
}
