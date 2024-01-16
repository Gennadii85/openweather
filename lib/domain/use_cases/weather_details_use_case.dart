import 'package:openweather/data/model/weather_details_model.dart';
import 'package:openweather/data/repositories/weather_details_repository.dart';

class WeatherDetailsUseCase {
  final WeatherDetailsRepository repository;

  WeatherDetailsUseCase(this.repository);

  Future<WeatherDetailsModel> getDetailsWeather() async {
    return await repository.getDetailsWeather();
  }
}
