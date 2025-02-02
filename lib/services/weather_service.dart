/* 📌 Подключаем библиотеку dart:convert,
 которая умеет кодировать и декодировать JSON.
*/
import 'dart:convert'; 

/* 📌 Это библиотека для работы с HTTP-запросами.
📌 Она позволяет отправлять запросы к API и получать ответы.
 */
import 'package:http/http.dart' as http;

import 'package:weatherapp/models/weather_model.dart';

class WeatherService {
  /* 📌 Это основной адрес API,
   к которому мы будем добавлять параметры (город, ключ API и т. д.).
  */
  static const String _baseUrl = 'https://api.openweathermap.org/data/2.5/weather';
  final String apiKey; // API-ключ

  WeatherService(this.apiKey); // Конструктор

  // Функция запроса погоды по названию города
  Future<Weather> getWeather(String cityName) async {
    final url = Uri.parse('$_baseUrl?q=$cityName&appid=$apiKey&units=metric&lang=ru');
    
    final response = await http.get(url); // Отправляем GET-запрос

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body); // Декодируем JSON

      if (data['cod'] != 200) {
        throw Exception('Ошибка API: ${data['message']}'); // Проверяем код ответа
      }

      return Weather.fromJson(data); // Преобразуем JSON в объект Weather
    } else {
      throw Exception('Ошибка загрузки погоды: ${response.statusCode}');
    }
  }
}