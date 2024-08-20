import 'package:flutter/material.dart';
import 'package:weather_api_flutter/repository/location_repository.dart';
import 'package:weather_api_flutter/repository/weather_repository.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Location().getCurrentLocation();
          getLocationWeather();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
