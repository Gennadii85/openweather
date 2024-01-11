import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openweather/data/repositories/weather_repository.dart';
import 'package:openweather/domain/use_cases/weather_use_case.dart';
import 'package:openweather/presentation/cubits/details_page/details_page_cubit.dart';
import 'package:openweather/presentation/cubits/home_page/home_page_cubit.dart';
import 'package:openweather/presentation/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final HomePageCubit homePageCubit = HomePageCubit(
    WeatherUseCase(WeatherRepository()),
  );

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => homePageCubit,
          child: const HomePage(),
        ),
        BlocProvider(
          create: (context) => DetailsPageCubit(),
        ),
      ],
      child: const HomePage(),
    );
  }
}
