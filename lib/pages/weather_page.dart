import 'package:flutter/material.dart';
import '../services/weather_service.dart';
import '../models/weather_model.dart';

class WeatherPage extends StatefulWidget {
  final WeatherService weatherService; // Передаём сервис в страницу

  const WeatherPage({super.key, required this.weatherService});
/* State - логика, 👉 Это метод, который создаёт состояние (State) для WeatherPage.
👉 Когда Flutter создаёт WeatherPage, он вызывает createState(), чтобы создать _WeatherPageState.

📌 Проще говоря:
📌 WeatherPage – это оболочка, а _WeatherPageState – это его содержимое и логика.
📌 createState() говорит Flutter, какой State использовать для этого экрана.
*/
  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  Weather? _weather; // Переменная для хранения данных о погоде
  String _cityName = "Almaty"; // Город по умолчанию
  bool _isLoading = false; // Флаг загрузки

  // Функция для загрузки погоды
  Future<void> _fetchWeather() async {
    /* 📌 Что делает setState()?
✔ Говорит Flutter: "Эй, обнови экран!"
✔ Устанавливает _isLoading = true, чтобы показать крутящийся индикатор загрузки
✔ Запускает анимацию CircularProgressIndicator() (в build())

👉 Если не вызвать setState(), то UI не обновится и индикатор не появится. */
    setState(() {
      _isLoading = true; // Показываем индикатор загрузки
    });

    try {
      final weather = await widget.weatherService.getWeather(_cityName); // Запрашиваем погоду
      setState(() {
        _weather = weather; // Сохраняем полученные данные
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Ошибка: ${e.toString()}")),
      );
    } finally {
      setState(() {
        _isLoading = false; // Прячем индикатор загрузки
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchWeather(); // Загружаем погоду при запуске страницы
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Погода в $_cityName"), centerTitle: true),
      body: Center(
        child: _isLoading
            ? const CircularProgressIndicator() // Показываем загрузку
            : _weather != null
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${_weather!.temperature.round()}°C",
                        style: const TextStyle(fontSize: 40),
                      ),
                      Text(
                        _weather!.description,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ],
                  )
                : const Text("Не удалось загрузить данные"),
      ),
    );
  }
}

