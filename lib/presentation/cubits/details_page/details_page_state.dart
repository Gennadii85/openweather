part of 'details_page_cubit.dart';

class DetailsPageState {}

final class DetailsInitial extends DetailsPageState {}

class DetailsLoad extends DetailsPageState {
  final WeatherDetailsModel weather;
  DetailsLoad({
    required this.weather,
  });
}

class DetailsError extends DetailsPageState {
  final String error;

  DetailsError(this.error);
}
