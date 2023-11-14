import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/map/domain/app_lat_long.dart';
import 'package:flutter_application_1/page/uslugi_page.dart';
import 'package:flutter_application_1/page/home_page.dart';
import 'package:flutter_application_1/page/profile_page.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import 'package:flutter_application_1/map/domain/location_service.dart';

class SixScreen extends StatefulWidget {
  const SixScreen({Key? key}) : super(key: key);

  @override
  State<SixScreen> createState() => _SixScreenState();
}

class _SixScreenState extends State<SixScreen> {
  
  int _segmentedControlIndex = 0;
  final mapControllerCompleter = Completer<YandexMapController>();
  
  @override
  void initState() {
    super.initState();
    _initPermission().ignore();
  }

  int _selectedIndex = 2;
@override
Widget build(BuildContext context) {
  return Scaffold(
    body: Column(
        children: [
          SizedBox(height: 35), // Верхний отступ
          CupertinoSegmentedControl<int>(
            children: const {
              0: Padding(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: Text('На карте'),
              ),
              1: Padding(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: Text('Списком'),
              ),
            },
            onValueChanged: (index) {
              setState(() {
                _segmentedControlIndex = index;
              });
            },
            groupValue: _segmentedControlIndex,
          ),
          Expanded(
            child: IndexedStack(
              index: _segmentedControlIndex,
              children: [
                _buildMapWidget(),  // Добавляем виджет карты
                _buildClinicListWidget(),  // Добавляем виджет списка
              ],
            ),
          ),
          SizedBox(height: 20), // Нижний отступ
        ],
      ),
                  bottomNavigationBar: BottomNavigationBar(
      type: BottomNavigationBarType.fixed, // Фиксированные позиции элементов
      items: <BottomNavigationBarItem>[
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
          icon: Icon(Icons.person),
          label: 'Профиль',
        ),
      ],
      unselectedItemColor: const Color(0xFFAAAAAA), // Цвет неактивных элементов
      selectedItemColor: const Color(0xFF1A6FEE), // Цвет активного элемента
      currentIndex: _selectedIndex, // Указываем текущий активный элемент
      onTap: (int index) {
        setState(() {
          _selectedIndex = index; // Устанавливаем выбранный индекс по нажатию
          if (index == 0) {
            // Обработка нажатия на "Главная"
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ThirdScreen()),
            );
          } else if (index == 1) {
            // Обработка нажатия на "Услуги"
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FourthScreen()),
            );
          } else if (index == 2) {
            // Обработка нажатия на "Рядом"
            
          } else if (index == 3) {
            // Обработка нажатия на "Профиль"
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfileScreen()),
            );
          }
        });
      },
      selectedLabelStyle: TextStyle(fontSize: 12), // Уменьшаем размер текста выбранного элемента
      unselectedLabelStyle: TextStyle(fontSize: 12), // Уменьшаем размер текста не выбранного элемента
      showUnselectedLabels: true, // Показывать текст для невыбранных элементов
    ),
  );
}

    // Виджет для отображения карты или списка клиник
  Widget _buildContent() {
    if (_segmentedControlIndex == 0) {
      return _buildMapWidget(); // Отображаем карту
    } else {
      return _buildClinicListWidget(); // Отображаем список клиник
    }
  }

   // Виджет для отображения карты
Widget _buildMapWidget() {
  return Center(
    child: ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: SizedBox(
        width: 348,
        height: 572,
        child: YandexMap(
          onMapCreated: (controller) {
            if (!mapControllerCompleter.isCompleted) {
              mapControllerCompleter.complete(controller);
            }
          },
        ),
      ),
    ),
  );
}

    // Виджет для отображения списка клиник
  Widget _buildClinicListWidget() {
    return ListView(
      children: [
        _buildClinicItem('Клиника №91', 'Пушкинская ул., д.23'),
        _buildClinicItem('Клиника №13', 'Павловская ул., д.3к4'),
        _buildClinicItem('Клиника №45', 'ул. Дегтирева, д.8'),
      ],
    );
  }

    // Метод для создания элемента списка клиник
  Widget _buildClinicItem(String name, String address) {
    return ListTile(
      title: Text(
        name,
        style: TextStyle(color: const Color(0xFF1A6FEE)),
      ),
      subtitle: Text(
        address,
        style: TextStyle(color: const Color(0xFF888888).withOpacity(0.5)),
      ),
    );
  }

  /// Проверка разрешений на доступ к геопозиции пользователя
  Future<void> _initPermission() async {
    if (!await LocationService().checkPermission()) {
      await LocationService().requestPermission();
    }
    await _fetchCurrentLocation();
  }

  /// Получение текущей геопозиции пользователя
  Future<void> _fetchCurrentLocation() async {
    AppLatLong location;
    const defLocation = MoscowLocation();
    try {
      location = await LocationService().getCurrentLocation();
    } catch (_) {
      location = defLocation;
    }
    _moveToCurrentLocation(location);
  }

  /// Метод для показа текущей позиции
  Future<void> _moveToCurrentLocation(
    AppLatLong appLatLong,
  ) async {
    (await mapControllerCompleter.future).moveCamera(
      animation: const MapAnimation(type: MapAnimationType.linear, duration: 1),
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: Point(
            latitude: appLatLong.lat,
            longitude: appLatLong.long,
          ),
          zoom: 12,
        ),
      ),
    );
  }
}
