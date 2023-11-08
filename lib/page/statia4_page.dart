import 'package:flutter/material.dart';

class Statia4Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Правильное питание для кошек'), 
      ),
      body: ListView(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10.0),
              bottomRight: Radius.circular(10.0),
            ),
            child: Image.asset(
              'assets/cat.jpg', 
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Правильное питание для кошек', 
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Когда речь заходит о заботе о наших пушистых друзьях, правильное питание играет важную роль в обеспечении их здоровья и счастья. В этой статье мы рассмотрим ключевые аспекты балансированного рациона для кошек, чтобы убедиться, что ваш любимец получает все необходимое для здоровой и счастливой жизни.',
                ),
                SizedBox(height: 20),
                Text(
                  'Протеиновая пища и ее значение', 
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Высококачественные протеины не менее важны для кошек, чем для собак. Они помогают поддерживать мышечную массу и обеспечивают кошку всеми необходимыми аминокислотами. Учитывайте особенности своей кошки, предпочтения и рекомендации ветеринара, чтобы подобрать оптимальное количество белка в её рационе.',
                ),
                SizedBox(height: 20),
                Text(
                  'Углеводы и их роль', 
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'В отличие от собак, кошки не нуждаются в больших количествах углеводов в своем рационе. Однако, они могут получать углеводы из овощей и растительных источников. Цельные зерновые также могут быть полезны, но также следует обсудить это с ветеринаром.',
                ),
                SizedBox(height: 20),
                Text(
                  ' Жиры в рационе кошек', 
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Жиры играют важную роль в питании кошачьего организма. Они важны для здоровья кожи и шерсти, а также участвуют в усвоении важных витаминов. Подбирайте оптимальное количество и качество жиров в рационе своей кошки, учитывая её особенности и потребности.',
                ),
                SizedBox(height: 20),
                Text(
                  'Индивидуальные потребности кошки', 
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Каждая кошка уникальна, и важно учитывать её индивидуальные потребности при планировании её рациона. Возраст, состояние здоровья, особенности поведения и предпочтения - все это стоит учитывать для того, чтобы обеспечить вашу кошку всем необходимым.',
                ),
                // ... (остальной текст статьи)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
