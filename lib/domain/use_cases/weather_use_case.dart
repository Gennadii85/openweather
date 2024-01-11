import 'package:openweather/data/model/weather_model.dart';
import 'package:openweather/data/repositories/weather_repository.dart';

class WeatherUseCase {
  final WeatherRepository repository;

  WeatherUseCase(this.repository);

  Future<WeatherModel> getWeather() async {
    return await repository.getWeather();
  }
}
