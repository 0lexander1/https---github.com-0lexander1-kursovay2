import 'package:flutter/material.dart';
import 'package:flutter_application_1/page/home_page.dart';
import 'package:flutter_application_1/widget/button.dart';
import 'package:flutter_application_1/widget/text_place.dart';
import 'package:flutter_application_1/widget/field.dart';
import 'package:flutter_application_1/page/second_page.dart';
import 'package:flutter_application_1/widget/authorization/reg_en_button.dart';
import 'package:flutter_application_1/widget/image.dart';
import 'package:flutter_application_1/widget/authorization/authorization_button.dart';
import 'package:flutter_application_1/widget/forget_password.dart';
import 'package:flutter/services.dart';
import 'package:supabase/supabase.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_application_1/AppConstants/constants.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
  
}

class _FirstScreenState extends State<FirstScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repeatpasswordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  bool _isButtonEnabled = false;
  bool _isButtonEnabledTwo = false;
  bool isSignInSelected = true;
  
  final supabase = SupabaseClient(
  "https://kozqhfezvhmvchjzibkm.supabase.co",
  "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImtvenFoZmV6dmhtdmNoanppYmttIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTk4OTA5MTQsImV4cCI6MjAxNTQ2NjkxNH0.djBwA5y5V1DGgVEAMiqo1UgVXkpECIDZ-EcoDCE6OBY",
  );

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _repeatpasswordController.dispose();
    super.dispose();
  }

  void _checkFieldsone() {
    setState(() {
      _isButtonEnabled = _emailController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty;
    });
  }

  void _checkFieldstwo() {
    setState(() {
      _isButtonEnabledTwo = _emailController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty &&
          _repeatpasswordController.text.isNotEmpty &&
          _passwordController.text == _repeatpasswordController.text;
    });
  }

  void createNewUser() async {
    final checkResponse = await supabase
      .from('Users')
      .select()
      .eq('email', _emailController.text)
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
        msg: "Почта уже используется",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }else {
      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SecondScreen(
            dataFromControllerOne: _emailController.text,
            dataFromControllerTwo: _passwordController.text,
          ), 
        ),
      );
    }
  }

  getUserIdByEmail(email) async {
    final response = await supabase
        .from('Users')
        .select('id')
        .eq('email', email) 
        .single()
        .execute();

    if (response.status != 200) {
      Fluttertoast.showToast(
        msg: "Ошибка при получении id пользователя",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    } else {
      AppConstants.userID = response.data['id'] as int;
    }
  }

  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
      
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 231, 229, 229),
        body: SingleChildScrollView(
          child: Center(
          child: Column(
            children: [
              SizedBox(
                height: screenHeight * 0.5,
                child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0),
                      ),
                    ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: screenHeight * 0.07,), 
                          const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ImageMain(
                                    width: 0.8,
                                    height: 0.3,
                                    picture: 'assets/logo.svg')
                              ]),
                          const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextPlace(
                                  font: 'GoodDog',
                                  txt: "Ветеринарная клиника", 
                                  align: TextAlign.center, 
                                  st: FontWeight.bold, 
                                  width: 0.9, 
                                  height: 0.07, 
                                  backgroundColor: Colors.white, 
                                  colortxt: Colors.black, 
                                  size: 28)
                              ]),
                          SizedBox(height: 9), 
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: screenHeight * 0.05,
                                child: AuthorizationButton(
                                  text: "Авторизация",
                                  isSelected: isSignInSelected,
                                  onSelected: (isSelected) {
                                    setState(() {
                                      isSignInSelected = isSelected;
                                      _emailController.text = "";
                                      _repeatpasswordController.text = "";
                                      _passwordController.text = "";
                                      _isButtonEnabled = false;
                                      _isButtonEnabledTwo = false;
                                    });
                                  },
                                ),
                              ),
                              SizedBox(width: screenWidth * 0.08),
                              SizedBox(
                                height: screenHeight * 0.05,
                                child: AuthorizationButton(
                                  text: "Регистрация",
                                  isSelected: !isSignInSelected,
                                  onSelected: (isSelected) {
                                    setState(() {
                                      isSignInSelected = !isSelected;
                                      _emailController.text = "";
                                      _repeatpasswordController.text = "";
                                      _passwordController.text = "";
                                      _isButtonEnabled = false;
                                      _isButtonEnabledTwo = false;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ])),
              ),
              SizedBox(
                height: screenHeight * 0.5,
                child: Container(
                  color: const Color.fromRGBO(250, 245, 245, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      isSignInSelected
                          ? Column(children: [
                              SizedBox(
                                height: screenHeight * 0.03,
                              ),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    MyField(
                                      type: TextInputType.text,
                                      width: 0.8,
                                      labtext: 'Email',
                                      height: 0.1,
                                      colortxt: Colors.black,
                                      mode: false,
                                      hinttxt: '',
                                      onChange: (value)  {
                                        if (isSignInSelected) {
                                          setState(() {
                                            _emailController.text = value;
                                            _checkFieldsone();
                                          });
                                        } else {
                                          setState(() {
                                            _emailController.text = value;
                                            _checkFieldstwo();
                                          });
                                        }
                                      },
                                      controller: _emailController,
                                    ),
                                  ]),
                              SizedBox(
                                height: screenHeight * 0.03,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  MyField(
                                    type: TextInputType.text,
                                    width: 0.8,
                                    labtext: 'Password',
                                    height: 0.1,
                                    colortxt: Colors.black,
                                    mode: true,
                                    hinttxt: '',
                                    onChange: (value) {
                                      if (isSignInSelected) {
                                        setState(() {
                                          _passwordController.text = value;
                                          _checkFieldsone();
                                        });
                                      } else {
                                        setState(() {
                                          _passwordController.text = value;
                                          _checkFieldstwo();
                                        });
                                      }
                                    },
                                    controller: _passwordController,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: screenHeight * 0.03,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FogetPassword(
                                    backgroundColor:
                                        const Color.fromRGBO(100, 124, 234, 0),
                                    colortxt: const  Color(0xFF1A6FEE),
                                    height: 0.05,
                                    page: (context) => ThirdScreen(),
                                    txt: "Забыли пароль?",
                                    width: 0.2,
                                  ),
                                  SizedBox(
                                    width: screenWidth * 0.45,
                                  )
                                ],
                              ),
                              SizedBox(
                                height: screenHeight * 0.0845,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ButtonEntry(
                                    size: 16,
                                    isEnabled: _isButtonEnabled,
                                    backgroundColor: _isButtonEnabled
                                        ? const  Color(0xFF1A6FEE)
                                        : const  Color(0xFF1A6FEE),
                                    colortxt: Colors.white,
                                    height: 0.09,
                                    check: () async {

                                      String email = _emailController.text;
                                      String password = _passwordController.text;

                                      try {
                                        var response = await supabase
                                            .from('Users')
                                            .select()
                                            .eq('email', email)
                                            .eq('password', password)
                                            .execute();
                                        if (response.status == 200) {
                                          var data = response.data;
                                          await getUserIdByEmail(_emailController.text);
                                          email = _emailController.text;
                                          // Проверка, найдены ли пользователь и пароль в базе данных
                                          if (data.length > 0) {
                                            Fluttertoast.showToast(
                                              msg: "Вход в систему",
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
                                                builder: (context) => ThirdScreen(), 
                                              ),
                                            );
                                          } else {
                                            Fluttertoast.showToast(
                                              msg: "Введен неверный пароль",
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.BOTTOM,
                                              timeInSecForIosWeb: 1,
                                              backgroundColor: Colors.red,
                                              textColor: Colors.white,
                                            );
                                          }
                                        } else {
                                          // Обработка ошибки, если запрос не удался
                                           throw Exception('Ошибка запроса к базе данных');
                                        }
                                        } catch (error) {
                                          // Обработка ошибки
                                          print(error.toString());
                                          Fluttertoast.showToast(
                                              msg: "Такой почты нет в системе",
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.BOTTOM,
                                              timeInSecForIosWeb: 1,
                                              backgroundColor: Colors.red,
                                              textColor: Colors.white,
                                          );
                                      }
                                    },
                                    txt: "Войти",
                                    width: 0.8,
                                  )
                                ],
                              ),
                            ])
                          : Column(children: [
                              SizedBox(
                                height: screenHeight * 0.03,
                              ),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    MyField(
                                      type: TextInputType.emailAddress,
                                      width: 0.8,
                                      labtext: 'Email',
                                      height: 0.1,
                                      colortxt: Colors.black,
                                      mode: false,
                                      hinttxt: '',
                                      onChange: (value) {
                                        if (isSignInSelected) {
                                          setState(() {
                                          _emailController.text =value;
                                          _checkFieldstwo();
                                          });
                                        }
                                      },
                                      controller: _emailController,
                                    ),
                                  ]),
                              SizedBox(
                                height: screenHeight * 0.03,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  MyField(
                                    type: TextInputType.text,
                                    width: 0.8,
                                    labtext: 'Password',
                                    height: 0.1,
                                    colortxt: Colors.black,
                                    mode: true,
                                    hinttxt: '',
                                    onChange: (value) {
                                      if (isSignInSelected) {
                                        setState(() {
                                          _passwordController.text = value;
                                          _checkFieldsone();
                                        });
                                      } else {
                                        setState(() {
                                          _passwordController.text = value;
                                          _checkFieldstwo();
                                        });
                                      }
                                    },
                                    controller: _passwordController,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: screenHeight * 0.03,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  MyField(
                                    type: TextInputType.text,
                                    width: 0.8,
                                    labtext: 'Repeat password',
                                    height: 0.1,
                                    colortxt: Colors.black,
                                    mode: true,
                                    hinttxt: '',
                                    onChange: (value) {
                                      if (!isSignInSelected) {
                                        setState(() {
                                          _repeatpasswordController.text =value;
                                          _checkFieldstwo();
                                        });
                                      }
                                    },
                                    controller: _repeatpasswordController,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: screenHeight * 0.0625,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ButtonEntry(
                                    size: 16,
                                    isEnabled: _isButtonEnabledTwo,
                                    backgroundColor: _isButtonEnabledTwo
                                        ? const  Color(0xFF1A6FEE)
                                        : const Color(0xFF1A6FEE),
                                    colortxt: Colors.white,
                                    height: 0.09,
                                    check: () {
                                      createNewUser();
                                    },
                                    txt: "Далее",
                                    width: 0.8,
                                  )
                                ],
                              ),
                            ])
                    ],
                  ),
                ),
              ),
            ],
          ),
        )));
  }
}
