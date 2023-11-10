import 'package:flutter/material.dart';

class Statia5Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Обучение щенков',
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
              'assets/cobaka3.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Обучение щенков',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Обучение щенков - это увлекательный процесс, который требует терпения, понимания и последовательности. Начать обучение нужно как можно раньше, потому что молодые собаки легче усваивают новую информацию и привыкания. Однако, важно помнить, что каждая собака уникальна и может иметь свои особенности при обучении.',
                ),
                SizedBox(height: 20),
                Text(
                  'Важность социализации',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Социализация играет огромную роль в обучении щенков. Чем раньше вы начнете знакомить своего щенка с другими собаками, людьми, различными звуками и окружающей средой, тем легче ему будет адаптироваться к различным ситуациям в будущем.',
                ),
                SizedBox(height: 20),
                Text(
                  'Тренировка терпения',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Как и всякий процесс обучения, требуется целая порция терпения. Щенки, особенно породы с высоким уровнем энергии, могут быть беспокойными и отвлекаться легче. Важно быть терпеливым и осознавать, что успех приходит через постоянство и терпение.',
                ),
                SizedBox(height: 20),
                Text(
                  'Социализация и коммуникация',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Умение взаимодействовать с другими собаками и людьми очень важно для успешной социализации и обучения щенка. Регулярные игры с другими собаками и общение с разными людьми помогут вашему питомцу стать уравновешенным и дружелюбным.',
                ),
                SizedBox(height: 20),
                Text(
                  'Построение связи с вами',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Обучение щенков также предполагает построение четкой и устойчивой связи между вами и вашим питомцем. Положительное подкрепление, игры, тренировки - все это способы укрепить связь и доверие с вашим питомцем.',
                ),
                // остальная часть текста статьи с добавленными подзаголовками
              ],
            ),
          ),
        ],
      ),
    );
  }
}
