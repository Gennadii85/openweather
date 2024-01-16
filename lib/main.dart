import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openweather/core/variables.dart';
import 'package:openweather/presentation/pages/details_page.dart';
import 'package:openweather/presentation/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => VariablesCubits().homePageCubit,
          child: const HomePage(),
        ),
        BlocProvider(
          create: (context) => VariablesCubits().detailsPageCubit,
          child: const DetailsPage(),
        ),
      ],
      child: const HomePage(),
    );
  }
}
