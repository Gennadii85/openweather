import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:openweather/data/model/weather_model.dart';

class WeatherRepository {
  final String city = 'Odessa';
  final String apiKey = 'eb2ad68438537913ba1f7fa6b92ae088';
  final String baseUrl = 'https://api.openweathermap.org/data/2.5/weather';

  Future<WeatherModel> getWeather() async {
    final response = await http
        .get(Uri.parse('$baseUrl?q=$city&appid=$apiKey&units=metric'));
    //* I want to receive weather only for Odessa in English but in the metric system.
    //* According to the API documentation, the request looks like this.
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return WeatherModel.fromJson(data);
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
