import 'package:flutter/material.dart';
import 'package:flutter_application_1/page/third_page.dart';


class CodeInput extends StatefulWidget {
  @override
  _CodeInputState createState() => _CodeInputState();
}

class _CodeInputState extends State<CodeInput> {
  List<TextEditingController> controllers = List.generate(
    4,
    (index) => TextEditingController(),
  );


  String combinedText = ''; // Переменная для кода

  @override
  void initState() {
    super.initState();

    // Следим за изменениями в каждом контроллере и обновляем combinedText
    for (int i = 0; i < controllers.length; i++) {
      controllers[i].addListener(() {
        setState(() {
          combinedText = controllers.map((controller) => controller.text).join();
        });

        // Проверяем, если текст достаточно длинный, то выполняем навигацию
        if (combinedText.length == 4) {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => SixthScreen()));
        }
      });
    }
  }
  
 void moveToNextField(int currentIndex) {
    if (currentIndex < controllers.length - 1) {
      // Фокусируемся на следующем контроллере
      FocusScope.of(context).nextFocus();
    }
  }

  @override
  Widget build(BuildContext context) {

    // Вычисляем ширину прямоугольника
    double screenWidth = MediaQuery.of(context).size.width;
    // Вычисляем высоту прямоугольника
    double screenHeight = MediaQuery.of(context).size.height;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < 4; i++)
          Container(
            width: screenWidth * 0.13,
            height: screenHeight * 0.07,
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: const Color.fromARGB(156, 233, 229, 229), 
              borderRadius: BorderRadius.circular(10.0),
              ),
            child: TextField(
              controller: controllers[i],
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              maxLength: 1,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              decoration: const InputDecoration(
                counterText:"",
                border: InputBorder.none,
              ),
              onChanged: (_) {
                // Вызываем метод для автоматического перехода
                moveToNextField(i);
              }
            ),
          ),
      ],
    );
  }
}