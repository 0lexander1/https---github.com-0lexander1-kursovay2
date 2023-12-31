import 'package:flutter_application_1/AppConstants/constants.dart';
import 'package:flutter_application_1/widget/authorization/reg_en_button.dart';
import 'package:flutter_application_1/widget/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/widget/field.dart';
import 'package:flutter_application_1/widget/text_place.dart';
import 'package:supabase/supabase.dart';
import 'package:fluttertoast/fluttertoast.dart';

// ignore: must_be_immutable
class SettingsScreen extends StatefulWidget {
  SettingsScreen({super.key});

  @override
  _SeettingsScreenState createState() => _SeettingsScreenState();
  int data = 0;
}

class _SeettingsScreenState extends State<SettingsScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _secondNameController = TextEditingController();
  final TextEditingController _thirdNameController = TextEditingController();
  bool _isButtonEnabled = false;

  final supabase = SupabaseClient(
  "https://kozqhfezvhmvchjzibkm.supabase.co",
  "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImtvenFoZmV6dmhtdmNoanppYmttIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTk4OTA5MTQsImV4cCI6MjAxNTQ2NjkxNH0.djBwA5y5V1DGgVEAMiqo1UgVXkpECIDZ-EcoDCE6OBY",
  );

  @override
  void dispose() {
    _firstNameController.dispose();
    _secondNameController.dispose();
    _thirdNameController.dispose();
    super.dispose();
  }

  void _checkFieldsone() {
    setState(() {
      _isButtonEnabled = _firstNameController.text.isNotEmpty &&
          _secondNameController.text.isNotEmpty &&
          _thirdNameController.text.isNotEmpty;
    });
  }

  void insertUser() async {
    final response = await supabase
    .from('Users')
    .upsert(
    [
      {
        'id': AppConstants.userID,
        'first_name': _firstNameController.text,
        'second_name': _secondNameController.text,
        'third_name': _thirdNameController.text,
      }
    ],
  )
  .execute();

    if (response.status == 200) {
      Fluttertoast.showToast(
          msg: "Ошибка при изменении данных пользователя",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 3,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
    }
    else{
       Fluttertoast.showToast(
          msg: "Данные изменены",
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
            builder: (context) => SettingsScreen(), 
            ),
        );
    }
  }
  void getUserData() async {
    final response = await supabase
    .from('Users')
    .select()
    .eq('id', AppConstants.userID)
    .execute();

    if (response.status != 200) {
      Fluttertoast.showToast(
            msg: "Ошибка при загрузке данных пользователя",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
      );
    }
    if (response.status == 200) {
      Fluttertoast.showToast(
            msg: "Данные пользователя загружены",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0,
      );

      final data = response.data;
      print(data);
      if (data.length > 0) {
        final user = data[0];
        _firstNameController.text = user['first_name'] ?? '';
        _secondNameController.text = user['second_name'] ?? '';
        _thirdNameController.text = user['third_name'] ?? '';
      }
    }
  }

    @override
    Widget build(BuildContext context) {
      
      if (widget.data != 1){
        getUserData();
        widget.data = 1;
      }
      final screenHeight = MediaQuery.of(context).size.height;

      return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
            child: Column(
              children: [ 
                Container(
                color: Colors.white,
                child:
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back),
                        color: Color.fromRGBO(220, 113, 127, 1),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      const ImageMain(
                          width: 0.2,
                          height: 0.1,
                          picture: "assets/logo.svg"
                      ),                     
                      const TextPlace(
                        font: "Source Sans Pro",
                        txt: "Ветеринарная клиника",
                        align: TextAlign.center,
                        st: FontWeight.bold,
                        width: 0.4,
                        height: 0.05,
                        backgroundColor: Colors.white,
                        colortxt: Colors.black,
                        size: 24),
                  ],
                ),
                ),
                SizedBox(
                  height: screenHeight * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyField(
                      type: TextInputType.text,
                      width: 0.8,
                      labtext: "Имя",
                      height: 0.1,
                      colortxt: Colors.black,
                      mode: false,
                      hinttxt: "",
                      onChange: (value) {
                        setState(() {
                          _firstNameController.text =
                              value; // Установка значения поля
                          _checkFieldsone();
                        });
                      },
                      controller: _firstNameController,
                    )
                  ],
                ),
                SizedBox(
                  height: screenHeight * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyField(
                      type: TextInputType.text,
                      width: 0.8,
                      labtext: "Фамилия",
                      height: 0.1,
                      colortxt: Colors.black,
                      mode: false,
                      hinttxt: "",
                      onChange: (value) {
                        setState(() {
                          _secondNameController.text =
                              value; // Установка значения поля
                          _checkFieldsone();
                        });
                      },
                      controller: _secondNameController,
                    )
                  ],
                ),
                SizedBox(
                  height: screenHeight * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyField(
                      type: TextInputType.text,
                      width: 0.8,
                      labtext: "Отчество",
                      height: 0.1,
                      colortxt: Colors.black,
                      mode: false,
                      hinttxt: "",
                      onChange: (value) {
                        setState(() {
                          _thirdNameController.text =
                              value; // Установка значения поля
                          _checkFieldsone();
                        });
                      },
                      controller: _thirdNameController,
                    )
                  ],
                ),
                SizedBox(
                  height: screenHeight * 0.05,
                ),
                
                SizedBox(
                  height: screenHeight * 0.05,
                ),
                SizedBox(
                  height: screenHeight * 0.1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ButtonEntry(
                      size: 16,
                      isEnabled: _isButtonEnabled,
                      backgroundColor: _isButtonEnabled
                          ? const Color.fromARGB(92, 220, 113, 127)
                          : const Color.fromRGBO(220, 113, 127, 100),
                      colortxt: Colors.white,
                      height: 0.09,
                      check: () {
                        insertUser();
                      },
                      txt: "Сохранить",
                      width: 0.8,
                    )
                  ],
                )
              ],
            ),
          )));
    }
  }
