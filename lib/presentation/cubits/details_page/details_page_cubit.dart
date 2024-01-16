import 'package:bloc/bloc.dart';
import 'package:openweather/data/model/weather_details_model.dart';
import 'package:openweather/domain/use_cases/weather_details_use_case.dart';

part 'details_page_state.dart';

class DetailsPageCubit extends Cubit<DetailsPageState> {
  final WeatherDetailsUseCase weatherDetailsUseCase;
  DetailsPageCubit(
    this.weatherDetailsUseCase,
  ) : super(DetailsInitial());
  Future<void> fetchDetailsWeather() async {
    try {
      final WeatherDetailsModel weatherDetailsData =
          await weatherDetailsUseCase.getDetailsWeather();
      emit(
        DetailsLoad(weather: weatherDetailsData),
      );
    } catch (e) {
      emit(
        DetailsError('Error fetching details weather data'),
      );
    }
  }
}
