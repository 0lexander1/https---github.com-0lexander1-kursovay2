import 'package:flutter/material.dart';
import 'package:flutter_application_1/page/fifth_page.dart';
import '../widget/list_item.dart';
import 'package:flutter_application_1/page/fourth_page.dart';


// Массив для первого ListView
const List<String> itemslistword = <String>[
  "Профилактика",
  "Груминг"
];

// Массив для второго ListView
const List<String> itemslistnum = <String>[
  "Обучение щенков",
  "Собака боится воды",
  "Почему кошки много спят?"
];

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Поиск',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 18.0),
              height: 152,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: itemslistword.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListItem(textItem: itemslistword[index]);
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
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
              padding: const EdgeInsets.all(16.0),
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
            Container(
              padding: const EdgeInsets.all(16.0),
              height: 204,
              child: ListView.builder(
                itemCount: itemslistnum.length,
                itemBuilder: (BuildContext context, int index) {
return ListItem(textItem: itemslistnum[index].toString());
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
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
      ),
    );
  }
}

           
        



        








