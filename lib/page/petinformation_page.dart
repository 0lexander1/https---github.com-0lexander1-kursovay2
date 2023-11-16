import 'package:flutter/material.dart';
import 'package:flutter_application_1/widget/field.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter_application_1/AppConstants/constants.dart';
import 'package:supabase/supabase.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../widget/authorization/reg_en_button.dart';

// ignore: must_be_immutable
class PetInformationScreen extends StatefulWidget {
  PetInformationScreen({super.key});

  @override
  _PetInformationScreenState createState() => _PetInformationScreenState();
  int data = 0;
}

class _PetInformationScreenState extends State<PetInformationScreen> {
  File? _image;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _petNameController = TextEditingController();
  final TextEditingController _petPorodaController = TextEditingController();
  final TextEditingController _ageValueController = TextEditingController();
  final TextEditingController _sexValueController = TextEditingController();
  final TextEditingController _okrasValueController = TextEditingController();
  final TextEditingController _weightValueController = TextEditingController();

  bool _isButtonEnabled = false;
  String owner = 'Владелец';

  final picker = ImagePicker();

  final supabase = SupabaseClient(
  "https://kozqhfezvhmvchjzibkm.supabase.co",
  "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImtvenFoZmV6dmhtdmNoanppYmttIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTk4OTA5MTQsImV4cCI6MjAxNTQ2NjkxNH0.djBwA5y5V1DGgVEAMiqo1UgVXkpECIDZ-EcoDCE6OBY",
  );

  @override
  void dispose() {
    _nameController.dispose();
    _petNameController.dispose();
    _petPorodaController.dispose();
    _ageValueController.dispose();
    _sexValueController.dispose();
    _okrasValueController.dispose();
    _weightValueController.dispose();
    super.dispose();
  }

    void _checkFieldsone() {
    setState(() {
      _isButtonEnabled = _nameController.text.isNotEmpty &&
          _petNameController.text.isNotEmpty &&
          _petPorodaController.text.isNotEmpty &&
          _ageValueController.text.isNotEmpty &&
          _sexValueController.text.isNotEmpty &&
          _okrasValueController.text.isNotEmpty &&
          _weightValueController.text.isNotEmpty;
    });
  }

    void insertUser() async {
    final response = await supabase
    .from('Pet')
    .upsert(
    [
      {
      'id': AppConstants.petID,
      'Name': _petNameController.text,
      'Poroda': _petPorodaController.text,
      'Age': _ageValueController.text,
      'Sex': _sexValueController.text,
      'Okras': _okrasValueController.text,
      'Ves': _weightValueController.text,
      'Vladelec': _nameController.text,
      }
    ],
  )
   // ignore: deprecated_member_use
  .execute();

    if (response.status == 200) {
      Fluttertoast.showToast(
          msg: "Ошибка при изменении данных пользователя",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 3,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
    }
    else{
       Fluttertoast.showToast(
          msg: "Данные изменены",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 3,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        // ignore: use_build_context_synchronously
        Navigator.push(
            context,
            MaterialPageRoute(
            builder: (context) => PetInformationScreen(), 
            ),
        );
    }
  }
  void getPetData() async {
    final response = await supabase
    .from('Pet')
    .select()
    .eq('id', AppConstants.petID)
    // ignore: deprecated_member_use
    .execute();

    if (response.status != 200) {
      Fluttertoast.showToast(
            msg: "Ошибка при загрузке данных пользователя",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
      );
    }
    if (response.status == 200) {
      Fluttertoast.showToast(
            msg: "Данные пользователя загружены",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0,
      );

      final data = response.data;
      print(data);
      if (data.length > 0) {
        final pet = data[0];
        _petNameController.text = pet['Name'] ?? '';
        _petPorodaController.text = pet['Poroda'] ?? '';
        _ageValueController.text = pet['Age'] ?? '';
        _sexValueController.text = pet['Sex'] ?? '';
        _okrasValueController.text = pet['Okras'] ?? '';
        _weightValueController.text = pet['Ves'] ?? '';
        _nameController.text = pet['Vladelec'] ?? '';
      }
    }
  }

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




@override
Widget build(BuildContext context) {

 if (widget.data != 1){
        getPetData();
        widget.data = 1;
      }

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
                    child: Container(
                      height: 27,
                      width: 182,
                      child: Center(
                        child: MyField(
                        labtext: 'Кличка',
                        type: TextInputType.text,
                        width: 0.4,
                        height: 0.1,
                        colortxt: Colors.black,
                        mode: false,
                        hinttxt: "",
                        onChange: (value) {
                          setState(() {
                            _petNameController.text =
                                value; // Установка значения поля
                            _checkFieldsone();
                          });
                        },
                        controller: _petNameController,
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
            child: Container(
              width: 182,
              height: 50, // Высота контейнера
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: MyField(
                        labtext: 'Порода',
                        type: TextInputType.text,
                        width: 0.4,
                        height: 0.1,
                        colortxt: Colors.black,
                        mode: false,
                        hinttxt: "",
                        onChange: (value) {
                          setState(() {
                            _petPorodaController.text =
                                value; // Установка значения поля
                            _checkFieldsone();
                          });
                        },
                        controller: _petPorodaController,
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
                      child: MyField(
                        labtext: 'Возраст',
                        type: TextInputType.text,
                        width: 0.4,
                        height: 0.1,
                        colortxt: Colors.black,
                        mode: false,
                        hinttxt: "",
                        onChange: (value) {
                          setState(() {
                            _ageValueController.text =
                                value; // Установка значения поля
                            _checkFieldsone();
                          });
                        },
                        controller: _ageValueController,
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
                      child: MyField(
                        labtext: 'Пол',
                        type: TextInputType.text,
                        width: 0.4,
                        height: 0.1,
                        colortxt: Colors.black,
                        mode: false,
                        hinttxt: "",
                        onChange: (value) {
                          setState(() {
                            _sexValueController.text =
                                value; // Установка значения поля
                            _checkFieldsone();
                          });
                        },
                        controller: _sexValueController,
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
                      child: MyField(
                        labtext: 'Окрас',
                        type: TextInputType.text,
                        width: 0.4,
                        height: 0.1,
                        colortxt: Colors.black,
                        mode: false,
                        hinttxt: "",
                        onChange: (value) {
                          setState(() {
                            _okrasValueController.text =
                                value; // Установка значения поля
                            _checkFieldsone();
                          });
                        },
                        controller: _okrasValueController,
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
                      child: MyField(
                        labtext: 'Вес',
                        type: TextInputType.text,
                        width: 0.4,
                        height: 0.1,
                        colortxt: Colors.black,
                        mode: false,
                        hinttxt: "",
                        onChange: (value) {
                          setState(() {
                            _weightValueController.text =
                                value; // Установка значения поля
                            _checkFieldsone();
                          });
                        },
                        controller: _weightValueController,
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
                      onChanged: (value) {
                        setState(() {
                          _nameController.text =
                              value; // Установка значения поля
                          _checkFieldsone();
                        });
                      },
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
    SizedBox(height: 800),
    Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ButtonEntry(
                      size: 16,
                      isEnabled: _isButtonEnabled,
                      backgroundColor: _isButtonEnabled
                          ? const Color.fromARGB(92, 220, 113, 127)
                          : const Color.fromRGBO(220, 113, 127, 100),
                      colortxt: Colors.white,
                      height: 0.09,
                      check: () {
                        insertUser();
                      },
                      txt: "Сохранить",
                      width: 0.8,
                    )
                  ],
                )
      ],
    ),
  );
  
}
}
