import 'package:flutter/material.dart';
import 'package:weatherapp/components/my_title.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MyTitle(appTitle: 'Петрушка'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          "Здесь будет погода!",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
