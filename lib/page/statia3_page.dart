import 'package:flutter/material.dart';

class Statia3Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Правильное питание для собак',
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
              'assets/cobaka.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Правильное питание для здоровья вашей собаки',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Значение балансированного рациона',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Правильное питание играет ключевую роль в обеспечении здоровья и долголетия вашей собаки. Балансированный рацион должен включать в себя определенное количество белков, жиров, углеводов, витаминов и минералов, соответствующих возрасту, размеру и активности вашего питомца.',
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
                  'Высококачественные протеины играют важную роль в здоровье собаки, помогая строить и поддерживать мышечную массу. Оптимальное количество белка в рационе собаки зависит от ее возраста, активности и особенностей здоровья.',
                ),
                SizedBox(height: 20),
                Text(
                  'Углеводы и их влияние на энергию',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Углеводы предоставляют собакам энергию и могут быть источником важных питательных веществ, однако следует обращать внимание на источники углеводов в рационе, предпочтительно выбирать цельные зерновые и овощи.',
                ),
                SizedBox(height: 20),
                Text(
                  'Значение жиров в рационе собаки',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Жиры важны для поддержания здоровья кожи и шерсти, а также играют роль в питании собачьего организма. Правильное количество и качество жиров в рационе собаки существенно для ее общего здоровья.',
                ),
                SizedBox(height: 20),
                Text(
                  'Важность уникальных потребностей вашей собаки',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Каждая собака уникальна, поэтому важно учитывать ее индивидуальные потребности при разработке рациона. Возраст, размер, активность, состояние здоровья – все это факторы, которые необходимо учитывать для создания оптимального рациона.',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}