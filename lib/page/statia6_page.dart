import 'package:flutter/material.dart';

class Statia6Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Уникальные особенности кошек',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10.0),
              bottomRight: Radius.circular(10.0),
            ),
            child: Image.asset(
              'assets/cat5.jpg', // изображение, соответствующее теме статьи
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Уникальные особенности кошек',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Кошки - удивительные и загадочные создания, у которых есть свои уникальные качества и особенности. В этой статье мы рассмотрим некоторые из них, чтобы лучше понять наших пушистых друзей и наладить с ними более глубокую связь.',
                ),
                SizedBox(height: 20),
                Text(
                  'Независимость и самостоятельность',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Кошки обладают выраженной независимостью и предпочитают самостоятельность. Они могут быть преданы, но сохраняют свою независимость и свободу по сравнению с собаками.',
                ),
                SizedBox(height: 20),
                Text(
                  'Особенности коммуникации',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Кошки общаются с людьми и другими животными с помощью различных звуков, мимики и жестов. Умение расшифровывать их язык поможет укрепить связь с вашим питомцем.',
                ),
                SizedBox(height: 20),
                Text(
                  'Потребность в игре и развлечениях',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Кошки нуждаются в играх и активностях для поддержания физической и психологической активности. Игры помогают им развивать навыки охоты, освоение территории и укреплять связь с вами.',
                ),
                SizedBox(height: 20),
                Text(
                  'Особенности ухода и гигиены',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Кошки являются очень чистоплотными животными и уделяют много внимания уходу за собой. Важно предоставить им условия для чистоты и выбрать правильные средства ухода.',
                ),
                SizedBox(height: 20),
                Text(
                  'Сон и активность',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Кошки являются активными в ночное время, и им нужно много сна в течение суток. Понимание их цикла сна и активности поможет создать комфортные условия для вашего питомца.',
                ),
                // остальная часть текста статьи о уникальных особенностях кошек
              ],
            ),
          ),
        ],
      ),
    );
  }
}
