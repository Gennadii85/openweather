import 'package:flutter/material.dart';
import 'package:openweather/data/repositories/weather_details_repository.dart';
import 'package:openweather/data/repositories/weather_repository.dart';
import 'package:openweather/domain/use_cases/weather_details_use_case.dart';
import 'package:openweather/domain/use_cases/weather_use_case.dart';
import 'package:openweather/presentation/cubits/details_page/details_page_cubit.dart';
import 'package:openweather/presentation/cubits/home_page/home_page_cubit.dart';

class Variables {
  final errorStyle = const TextStyle(
    fontSize: 16,
    color: Colors.black,
    fontWeight: FontWeight.w400,
  );
  final cityName = const TextStyle(
    fontSize: 46,
    fontWeight: FontWeight.w400,
    color: Colors.amberAccent,
  );
}

class VariablesCubits {
  final HomePageCubit homePageCubit = HomePageCubit(
    WeatherUseCase(WeatherRepository()),
  );
  final DetailsPageCubit detailsPageCubit = DetailsPageCubit(
    WeatherDetailsUseCase(WeatherDetailsRepository()),
  );
}
