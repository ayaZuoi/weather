import 'package:flutter/material.dart';
import 'package:weather/pages/weatherpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: WeatherPage(
        

      ),

    );
  }
}
