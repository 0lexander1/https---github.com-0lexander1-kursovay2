import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class PetInformationScreen extends StatefulWidget {
  @override
  _PetInformationScreenState createState() => _PetInformationScreenState();
}

class _PetInformationScreenState extends State<PetInformationScreen> {
  File? _image;

  final picker = ImagePicker();
  String _petName = 'Кличка'; // Изначальное значение "Кличка"

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

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text(
        'Информация о питомце',
        style: TextStyle(
          fontSize: 20,
        ),
      ),
      centerTitle: true,
    ),
    body: Stack(
      children: [
        // Контейнер с изображением
        Positioned(
          top: 70, // Небольшой отступ от AppBar
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
          top: 140, // Расположение относительно верхней границы контейнера с изображением
          left: (MediaQuery.of(context).size.width - 40) / 2, // Центрируем по горизонтали
          child: IconButton(
            padding: EdgeInsets.all(0), // Убираем внутренний отступ
            icon: Icon(Icons.camera_alt),
            onPressed: getImage,
          ),
        ),
        
        // Новые контейнеры
        Positioned(
          top: 325, // Подбирайте координаты в зависимости от вашего дизайна
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
          top: 415, // Подбирайте координаты в зависимости от вашего дизайна
          left: (MediaQuery.of(context).size.width - 355) / 2, // Центрируем по горизонтали
          child: Container(
            width: 355,
            height: 300,
            decoration: BoxDecoration(
              color: const Color(0xFF307AE9),
              borderRadius: BorderRadius.circular(10),
            ),
            // здесь ты можешь добавить дополнительное содержимое, если это необходимо
          ),
          child: _image == null
              ? Center(child: Text('Выбрать фото'))
              : Image.file(_image!, fit: BoxFit.cover),
            ),


            ],
          ),
        ),
      ],
    ),
  );
}
}
