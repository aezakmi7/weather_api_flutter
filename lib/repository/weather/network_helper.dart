import 'package:dio/dio.dart';

class NetworkHelper {
  final String url;
  NetworkHelper(this.url);

  Future getData() async {
    try {
      Response response = await Dio().get(url);

      if (response.statusCode == 200) {
        return response.data; // Directly return the data
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }
}
