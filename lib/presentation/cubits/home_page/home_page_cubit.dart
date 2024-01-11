import 'package:bloc/bloc.dart';
import 'package:openweather/data/model/weather_model.dart';

import 'package:openweather/domain/use_cases/weather_use_case.dart';

part 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  final WeatherUseCase weatherUseCase;
  HomePageCubit(
    this.weatherUseCase,
  ) : super(HomePageInitial());

  Future<void> fetchWeather() async {
    try {
      final WeatherModel weatherData = await weatherUseCase.getWeather();
      emit(
        HomePageLoad(weather: weatherData),
      );
    } catch (e) {
      emit(
        HomePageError('Error fetching weather data'),
      );
    }
  }
}
