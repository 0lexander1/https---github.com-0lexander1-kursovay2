import 'package:flutter/material.dart';
import '../widget/list_item.dart';

// Массив для первого ListView
const List<String> itemslistword = <String>[
  "Первый",
  "Второй",
  "Третий",
  "Четыертый",
  "Пятый",
  "Шестой",
  "Седьмой"
];

// Массив для второго ListView
const List<int> itemslistnum = <int>[1, 2, 3, 4, 5, 6, 7];

class FourthScreen extends StatelessWidget {
  const FourthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            height: 152,
            width: 355,
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
                  'Интересные статьи',
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0), // Цвет надписи
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                TextButton.icon(
                  onPressed: () {
                    // Действие при нажатии на кнопку "Смотреть все"
                  },
                  label: Text(
                    'Смотреть все',
                    style: TextStyle(
                      color: Color(0xFF1A6FEE), // Цвет надписи
                    ),
                  ),
                  icon: Icon(
                    Icons.arrow_forward,
                    color: Color(0xFF1A6FEE), // Цвет стрелочки
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            height: MediaQuery.of(context).size.height * 0.5,
            child: ListView.builder(
              itemCount: itemslistnum.length,
              itemBuilder: (BuildContext context, int index) {
                return ListItem(textItem: itemslistnum[index].toString());
              },
            ),
          ),
        ],
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
