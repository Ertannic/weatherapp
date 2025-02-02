class Weather {
  // Название города
  final String cityName;
  // Температура
  final double temperature;
  // Описание погоды
  final String description;

  // Конструктор
  Weather({
    required this.cityName,
    required this.temperature,
    required this.description,
  });

  // Функция fromJson – переводит JSON в объект Weather
  /* 🔍 Что такое fromJson()?
  💡 Это функция, которая берёт JSON-данные и превращает их в объект Weather.
 */
  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      // Берём название города из JSON
      cityName: json['name'] ?? 'Неизвестный город',
      // Берём температуру
      temperature: json['main']['temp']?.toDouble() ?? 0.0,
      // Берём описание погоды
      description: json['weather'][0]['description'] ?? 'Нет данных',
    );
  }
}
