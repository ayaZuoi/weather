import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/servies/weather_servies.dart';

class WeatherPage extends StatefulWidget {
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final _weatherServers = WeatherServices('905eab146ed70ce1c7e7b68237d4c79c');
  weather? _weather;

  // Fetch weather
  _fetchWeather() async {
    String cityName = await _weatherServers.getCurrentCity();

    try {
      final weather = await _weatherServers.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      print(e);
    }
  }

  String getweatheranimation(String? maicond) {
    if (maicond == null) return 'assest/loading.json';
    switch (maicond.toLowerCase()) {
      case 'clouds':
      case 'mist':
      case 'snoke':
      case 'haze':
      case 'fog':
        return 'assest/cloud.json';
      case 'rain':
      case 'drizzle':
      case 'shower rain':
        return 'assest/rain.json';
      case 'thunderstorm':
        return 'assest/thander.json';
      case 'clear':
        return 'assest/sun.json';
      case 'dust':
        return 'assest/dust.json';

      default:
        return 'assest/sun.json';
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // City name
            Text(
              _weather?.cityname ?? 'Loading...',
              style: TextStyle(fontSize: 20.0, color: Colors.blue),
            ),
            //animation

            Lottie.asset(getweatheranimation(_weather?.maicond)),

            // Temperature
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${_weather?.teb.round()}',
                  style: TextStyle(
                      fontSize: 20.0,
                      color: const Color.fromARGB(255, 2, 0, 0)),
                ),
                Text(
                  '°C',
                  style: TextStyle(fontSize: 20.0, color: Colors.yellow),
                ),
              ],
            ),
            Text(
              _weather?.maicond ?? 'Loading...',
              style: TextStyle(fontSize: 20.0, color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}
