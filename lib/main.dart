/* import - импортирует Подключает основные виджеты Flutter,
 такие как MaterialApp, Scaffold, Text, Column и т. д.*/
import 'package:flutter/material.dart';
import 'pages/weather_page.dart';

// void main - функция для запуска нашего приложения MyApp
void main() {
  runApp(const MyApp());
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
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Loh',
      debugShowCheckedModeBanner: false,
      home: WeatherPage(),
    );
  }
}
