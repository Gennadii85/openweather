part of 'home_page_cubit.dart';

class HomePageState {}

final class HomePageInitial extends HomePageState {}

class HomePageLoad extends HomePageState {
  final WeatherModel weather;
  HomePageLoad({
    required this.weather,
  });
}

class HomePageError extends HomePageState {
  final String error;

  HomePageError(this.error);
}
