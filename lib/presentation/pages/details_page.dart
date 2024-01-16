import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openweather/core/variables.dart';
import 'package:openweather/data/model/date_time_converter.dart';
import 'package:openweather/data/model/weather_details_model.dart';
import 'package:openweather/presentation/cubits/details_page/details_page_cubit.dart';
import 'package:openweather/presentation/widgets/details_cart.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  late DetailsPageCubit detailsPageCubit;

  @override
  void initState() {
    super.initState();
    _getDetailsData();
  }

  Future<void> _getDetailsData() async {
    detailsPageCubit = BlocProvider.of<DetailsPageCubit>(context);
    await detailsPageCubit.fetchDetailsWeather();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Call 5 day / 3 hour forecast data'),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
            ),
            color: Colors.black,
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: BlocBuilder<DetailsPageCubit, DetailsPageState>(
          builder: (context, state) {
            if (state is DetailsLoad) {
              final List<ListData> date = state.weather.list;
              final List<int> time = date.map((e) => e.dt).toList();
              final List<String> temp =
                  date.map((e) => e.main.temp.toString()).toList();
              final List<String> speed =
                  date.map((e) => e.wind.speed.toString()).toList();
              final List<String> pressure =
                  date.map((e) => e.main.pressure.toString()).toList();
              final List<String> humidity =
                  date.map((e) => e.main.humidity.toString()).toList();
              return ListView.separated(
                separatorBuilder: (context, index) => const VerticalDivider(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: date.length,
                itemBuilder: (context, index) => DetailsCart(
                  time: UnixDateTimeConverter.getHour(
                    time[index],
                  ).toString(),
                  temp: temp[index],
                  speed: speed[index],
                  humidity: humidity[index],
                  pressure: pressure[index],
                ),
              );
            } else if (state is DetailsError) {
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
    );
  }
}
