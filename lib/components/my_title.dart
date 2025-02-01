import 'package:flutter/material.dart';

class MyTitle extends StatelessWidget {
  final String appTitle; // сумка - String. 

  const MyTitle({
    super.key,
    required this.appTitle, // передаю ее на заполнение.
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      appTitle,
      style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    );
  }
}
