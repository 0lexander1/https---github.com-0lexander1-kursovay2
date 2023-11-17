import 'package:flutter/material.dart';
import 'package:flutter_application_1/AppConstants/constants.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:supabase/supabase.dart';

class UslugaTerapia1Screen extends StatefulWidget {
  @override
  _UslugaTerapia1State createState() => _UslugaTerapia1State();
}

class _UslugaTerapia1State extends State<UslugaTerapia1Screen> {
  String? selectedClinic;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  final supabase = SupabaseClient(
  "https://kozqhfezvhmvchjzibkm.supabase.co",
  "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImtvenFoZmV6dmhtdmNoanppYmttIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTk4OTA5MTQsImV4cCI6MjAxNTQ2NjkxNH0.djBwA5y5V1DGgVEAMiqo1UgVXkpECIDZ-EcoDCE6OBY",
  );

    List<TimeOfDay> availableTimes = [
    TimeOfDay(hour: 10, minute: 0),
    TimeOfDay(hour: 11, minute: 0),
    TimeOfDay(hour: 12, minute: 0),
    TimeOfDay(hour: 13, minute: 0),
    TimeOfDay(hour: 14, minute: 0),
    TimeOfDay(hour: 15, minute: 0),
    TimeOfDay(hour: 16, minute: 0),
    TimeOfDay(hour: 17, minute: 0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Консультация ветеринара',
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.blue,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + kToolbarHeight + 16.0,
          left: 16.0,
          right: 16.0,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Описание услуги:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            SizedBox(height: 8),
            Text(
              'Сбор данных истории жизни и болезни, термометрия, аукультация, осмотр ротовой полости, ушных раковин, кожных покровов, взвешивание. Постановка предварительного и дифференциальных диагнозов. Выроботка тактики дальнейшего обследования и лечения животного.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Выберите филиал',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              width: 335,
              height: 48,
              child: DropdownButton<String>(
                value: selectedClinic,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedClinic = newValue; // обновляем выбранное значение
                  });
                },
                isExpanded: true,
                underline: SizedBox(), // убираем линию под текстом выбранного значения
                icon: Icon(Icons.keyboard_arrow_down), // добавляем иконку стрелки
                style: TextStyle(color: Colors.black), // цвет текста выбранного значения
                items: [
                  DropdownMenuItem(
                    value: 'clinic91',
                    child: Text(
                      'Клиника №91 Москва',
                      style: TextStyle(color: Color(0xff1A6FEE)), // цвет названия клиники
                    ),
                  ),
                  DropdownMenuItem(
                    value: 'clinic13',
                    child: Text(
                      'Клиника №13 Москва',
                      style: TextStyle(color: Color(0xff1A6FEE)), // цвет названия клиники
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Выберите дату',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              width: 335,
              height: 48,
              child: TextButton(
                onPressed: () {
                  _selectDate(context);
                },
                child: Text(
                  selectedDate != null
                      ? '${selectedDate!.day}.${selectedDate!.month}.${selectedDate!.year}'
                      : 'Выберите будний день',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Выберите время',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Container(
              height: 60, // уменьшаем высоту вдвое
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                itemCount: availableTimes.length,
                itemBuilder: (context, index) {
                  final time = availableTimes[index];
                  return InkWell(
                    onTap: () {
                      setState(() {
                        selectedTime = time;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.all(8),
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: selectedTime == time ? Colors.blue : Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: selectedTime == time
                            ? Border.all(color: Colors.blue, width: 2)
                            : null,
                      ),
                      child: Text(
                        time.format(context),
                        style: TextStyle(
                          fontSize: 16,
                          color: selectedTime == time ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            Container(
              width: 335,
              height: 56,
              child: ElevatedButton(
                
  onPressed: () async {
    if (selectedClinic != null && selectedDate != null && selectedTime != null) {
      final String formattedDate = selectedDate!.toIso8601String();
      final String formattedTime = '${selectedTime!.hour}:${selectedTime!.minute}';

      final existingRecords = await supabase.from('Priem')
        .select()
        .eq('data', formattedDate)
        .eq('time', formattedTime)
        .eq('ysluga', 'Консультация ветеринара') // замените на реальное название услуги
        .eq('felial', selectedClinic)
        .execute();

      if (existingRecords.status != 200) {
        print('Ошибка при выполнении запроса: ${existingRecords.status}');
      } else {
        if (existingRecords.data != null && existingRecords.data!.length > 0) {
          // Запись уже существует, выдать сообщение об ошибке
          Fluttertoast.showToast(
            msg: 'Запись на эту услугу на это время уже существует!',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        } else {
          // Вставить новую запись, поскольку запись не существует
        
    
                    final response = await supabase.from('Priem').insert([
                      {
                        'data': formattedDate,
                        'time': formattedTime,
                        'ysluga': 'Консультация ветеринара',
                        'felial': selectedClinic,
                        'userID': AppConstants.userID,
                      }
                    ]).execute();

                    if (response.status != 200) {
                      Fluttertoast.showToast(
                            msg: "Данные успешно отправлены в Supabase!",
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 3,
                            backgroundColor: Colors.green,
                            textColor: Colors.white,
                            fontSize: 16.0,
                      );
                    } else if (response.status != 200) {
                      Fluttertoast.showToast(
                            msg: "'Ошибка при отправке данных в Supabase: ${response.status}",
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 3,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0,
                      );
                    }
                    }
                    } 
                  } else {
                    Fluttertoast.showToast(
                      msg: 'Пожалуйста, выберите филиал, дату и время',
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 3,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0,
                    );
                  }
                },
                child: Text('Подтвердить'),
              ),
            ),
          ],
        ),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2024),
      selectableDayPredicate: (DateTime date) {
        // Ограничиваем выбор только будними днями (пн-пт)
        return date.weekday >= 1 && date.weekday <= 5;
      },
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }
}