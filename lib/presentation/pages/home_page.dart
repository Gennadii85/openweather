import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openweather/core/variables.dart';
import 'package:openweather/presentation/cubits/home_page/home_page_cubit.dart';
import 'package:openweather/presentation/pages/details_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomePageCubit homeCubit;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  Future<void> _getData() async {
    homeCubit = BlocProvider.of<HomePageCubit>(context);
    await homeCubit.fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Weather'),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
            ),
            color: Colors.black,
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: SingleChildScrollView(
          child: BlocBuilder<HomePageCubit, HomePageState>(
            builder: (context, state) {
              if (state is HomePageLoad) {
                final String iconnov = state.weather.weather[0].icon;
                return Column(
                  children: [
                    cityName(state),
                    Card(
                      child: Container(
                        height: 150,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1.5,
                            color: const Color.fromARGB(255, 233, 229, 229),
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.network(
                          'https://openweathermap.org/img/wn/$iconnov@2x.png',
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const DetailsPage(),
                        ),
                      ),
                      child: const Text('Details'),
                    ),
                  ],
                );
              } else if (state is HomePageError) {
                return Center(
                  child: Text(
                    state.error,
                    style: Variables().errorStyle,
                  ),
                );
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }

  Row cityName(HomePageLoad state) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          state.weather.name,
          style: const TextStyle(
            fontSize: 46,
            fontWeight: FontWeight.w400,
            color: Colors.amberAccent,
          ),
        ),
      ],
    );
  }
}
