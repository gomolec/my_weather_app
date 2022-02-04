import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_weather_app/bloc/forecast_cubit/forecast_cubit.dart';
import 'package:my_weather_app/bloc/search_bloc/search_bloc.dart';
import 'package:my_weather_app/extensions.dart';

import 'package:my_weather_app/screens/home_screen/widgets/app_bar.dart';

import 'pages/pages.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ValueNotifier<int> currentIndexPage = ValueNotifier<int>(0);

  @override
  void dispose() {
    currentIndexPage.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: const Color(0xFFB9A8A1),
          appBar: CustomAppBar(
            title: (state is LocationLoaded)
                ? state.location.name!.capitalize()
                : "n/a",
          ),
          body: BlocBuilder<ForecastCubit, ForecastState>(
            builder: (context, state) {
              if (state is ForecastLoaded) {
                List<Widget> _pages = [
                  MainPage(forecast: state.forecast),
                  DetailsPage(forecast: state.forecast.current),
                  HourlyPage(forecast: state.forecast.hourly),
                ];
                return Column(
                  children: [
                    Expanded(
                      child: PageView(
                        onPageChanged: (index) {
                          currentIndexPage.value = index;
                        },
                        children: _pages,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ValueListenableBuilder(
                        valueListenable: currentIndexPage,
                        builder: (context, int _currentIndexPage, child) {
                          return DotsIndicator(
                            dotsCount: _pages.length,
                            position: _currentIndexPage.toDouble(),
                            decorator: const DotsDecorator(
                              activeColor: Colors.black,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        );
      },
    );
  }
}
