import 'package:weather_api_flutter/repository/network_helper.dart';

import 'location_repository.dart';

const String apiKey = 'c06ab1b596795f5e40480fdddf007dd1';

Future<dynamic> getLocationWeather() async {
  Location location = Location();
  await location.getCurrentLocation();

  NetworkHelper networkHelper = NetworkHelper(
      'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

  var weatherData = await networkHelper.getData();

  print(weatherData);

  return weatherData;
}
