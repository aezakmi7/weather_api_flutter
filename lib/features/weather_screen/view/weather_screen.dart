import 'package:flutter/material.dart';
import '../../../repository/repository.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  String? cityName;
  int? temperature;
  int? condition;

  WeatherModel weatherModel = WeatherModel();

  @override
  void initState() {
    fetchWeatherData();
    super.initState();
  }

  void fetchWeatherData() async {
    var weatherData = await weatherModel.getLocationWeather();
    updateUI(weatherData);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        cityName = 'Unable to get weather data';
        temperature = 0;
        return;
      }

      double temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      condition = weatherData['weather'][0]['id'];
      cityName = weatherData['name'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Location().getCurrentLocation();
          var weatherData = await weatherModel.getLocationWeather();

          updateUI(weatherData);
        },
        child: const Icon(Icons.refresh),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('${cityName}'),
            Text('$temperature° C'),
          ],
        ),
      ),
    );
  }
}
