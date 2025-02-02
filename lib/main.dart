/* import - импортирует Подключает основные виджеты Flutter,
 такие как MaterialApp, Scaffold, Text, Column и т. д.*/
import 'package:flutter/material.dart';
import 'services/weather_service.dart';
import 'pages/weather_page.dart';

// void main - функция для запуска нашего приложения MyApp
void main() async {
  final WeatherService weatherService = WeatherService(
      '12f4d97fcab370d53e0844d9e9bc1e56'); // Загружаем API-ключ из .env

  runApp(MyApp(weatherService));
}

/* 
1) StatelessWidget - 👉 Это виджет, который не меняется после создания. 
Если данные меняются – Flutter пересоздаёт весь виджет.
2) super.key - Это уникальный ID виджета, 
который помогает Flutter обновлять UI быстрее.
3) build() - Это функция, которая строит (отрисовывает) UI. 
Она вызывается каждый раз, когда что-то меняется.
4) BuildContext - Это информация о том, где этот виджет находится в приложении. 
Он помогает взаимодействовать с другими виджетами.
 */
class MyApp extends StatelessWidget {
  final WeatherService weatherService;

  const MyApp(this.weatherService, {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue, // Основной цвет приложения
      ),
      home: WeatherPage(
          weatherService: weatherService), // Передаём сервис в страницу погоды
    );
  }
}
