import 'package:flutter_application_1/page/first_page.dart';
import 'package:flutter_application_1/widget/authorization/reg_en_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/widget/field.dart';
import 'package:flutter_application_1/widget/text_place.dart';
import 'package:flutter_application_1/widget/authorization/pol.dart';
import 'package:supabase/supabase.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class SecondScreen extends StatefulWidget {
  final String dataFromControllerOne;
  final String dataFromControllerTwo;

  SecondScreen({
    required this.dataFromControllerOne,
    required this.dataFromControllerTwo,
  });

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  final supabase = SupabaseClient(
    "https://kozqhfezvhmvchjzibkm.supabase.co",
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImtvenFoZmV6dmhtdmNoanppYmttIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTk4OTA5MTQsImV4cCI6MjAxNTQ2NjkxNH0.djBwA5y5V1DGgVEAMiqo1UgVXkpECIDZ-EcoDCE6OBY",
  );

  @override
  void initState() {
    super.initState();
    createNewUser(); // Вызываем метод создания нового пользователя сразу после инициализации экрана
  }
  
  void createNewUser() async {
    final responseid = await supabase
    .from('Users')
    .select()
    .execute();
    final count = responseid.data.length + 2;
    final int newId = count + 1;

    final email = widget.dataFromControllerOne;
    // Проверка наличия уже существующих пользователей с указанным никнеймом
    final checkResponse = await supabase
        .from('Users')
        .select()
        .eq('email', email)
        .execute();

    if (checkResponse.status != 200) {
      Fluttertoast.showToast(
        msg: "Ошибка при выполнении запроса",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      return;
    } else if (checkResponse.data.isNotEmpty) {
      Fluttertoast.showToast(
        msg: "Никнейм уже занят, выберите другой",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    } else {
      final response = await supabase.from('Users').insert([
        {
          'id': newId,
          'first_name': '',
          'second_name': '',
          'third_name': '',
          'email': widget.dataFromControllerOne,
          'password': widget.dataFromControllerTwo,
          'role': 1,
        }
      ]).execute();

      if (response.status == 200) {
        Fluttertoast.showToast(
          msg: "Ошибка при создании пользователя",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 3,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      } else {
        Fluttertoast.showToast(
          msg: "Пользователь успешно создан!",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 3,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        Fluttertoast.showToast(
          msg: "Войдите в аккаунт",
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
            builder: (context) => FirstScreen(),
          ),
        );
      }
    }
  }
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Оставим пустой виджет; данная страница не будет ни отображаться, ни взаимодействовать с пользователем, так как операции будут автоматически выполняться в методе initState
      // (метод initState вызывается при первой отрисовке экрана).
    );
  }
}
