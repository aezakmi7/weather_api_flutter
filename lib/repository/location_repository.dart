import 'package:geolocator/geolocator.dart';

class Location {
  Location({
    this.latitude,
    this.longitude,
  });

  double? latitude;
  double? longitude;

  Future<void> getCurrentLocation() async {
    try {
      LocationPermission permission;
      permission = await Geolocator.requestPermission();

      Position position = await Geolocator.getCurrentPosition();
      latitude = position.latitude;
      longitude = position.longitude;

      print('Latitude: $latitude, Longitude: $longitude');
    } catch (e) {
      print(e);
    }
  }
}
