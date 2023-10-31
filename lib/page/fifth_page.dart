import 'package:flutter/material.dart';
import '../widget/list_item.dart';

// Массив для первого ListView
const List<String> itemslistword = <String>["Первый", "Второй", "Третий", "Четыертый", "Пятый", "Шестой", "Седьмой"];

// Массив для второго ListView
const List<int> itemslistnum = <int>[1, 2, 3, 4, 5, 6, 7];

class FifthScreen extends StatelessWidget {
  const FifthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('ListView 2')),
        backgroundColor: Colors.cyanAccent,
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            height: MediaQuery.of(context).size.height * 0.5,
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
            label: 'Профиль',
            icon: Icon(Icons.person),
            
          ),
        ],
        unselectedItemColor: const Color(0xFFAAAAAA), // Цвет неактивных элементов
        selectedItemColor: const Color(0xFF1A6FEE), // Цвет активного элемента "Главная"
      ),
    );
  }
}
