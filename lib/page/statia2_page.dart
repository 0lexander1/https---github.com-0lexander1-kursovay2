import 'package:flutter/material.dart';

class Statia2Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Почему кошки много спят'),
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
                  'Причины, по которым кошки много спят',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Защита и охота',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Сон для кошек — естественная защитная реакция. Они могут спать большую часть дня, чтобы сохранить энергию для охоты и защиты своей территории. Такой режим сна помогает им оставаться бдительными в темное время суток, когда охотятся более многие из их противников.',
                ),
                SizedBox(height: 20),
                Text(
                  'Адаптация к окружающей среде',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Кошки адаптировались к жизни в окружении, где охота может быть активной именно ночью, а не днем, поэтому они могут спать днем, чтобы быть активными в более подходящее время для охоты. Это естественное поведение, которое помогает им выживать и процветать в дикой природе.',
                ),
                SizedBox(height: 20),
                Text(
                  'Забота о здоровье',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Сон также играет важную роль в поддержании здоровья кошек. Во время сна они восстанавливаются и укрепляют свои иммунные системы, что помогает им оставаться здоровыми и жизнерадостными.',
                ),
                SizedBox(height: 20),
                Text(
                  'Биологические особенности',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Кошки являются хищниками, их организм адаптирован для экономии энергии, что включает в себя длительные периоды сна. Это биологическая особенность, позволяющая им поддерживать свои силы для охоты и активности в более подходящее время.',
                ),
                 SizedBox(height: 20),
                Text(
                  'Комфорт и безопасность',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Кошки ценят комфорт и безопасность, и спят много, чтобы восстанавливать свои силы и оставаться в безопасном месте. Это может быть естественной реакцией на окружающую среду и способом управления стрессом.',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
