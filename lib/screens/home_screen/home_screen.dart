import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:my_weather_app/bloc/forecast_cubit/forecast_cubit.dart';
import 'package:my_weather_app/bloc/search_bloc/location_bloc.dart';
import 'package:my_weather_app/bloc/theme_cubit/theme_cubit.dart';
import 'package:my_weather_app/extensions.dart';
import 'package:my_weather_app/screens/home_screen/widgets/app_bar.dart';
import 'package:my_weather_app/screens/home_screen/widgets/sun_custom_painter.dart';
import 'package:my_weather_app/theme.dart';

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
    return BlocBuilder<LocationBloc, LocationState>(
      builder: (context, state) {
        return Scaffold(
          appBar: CustomAppBar(
            title: (state is LocationLoaded)
                ? state.location.name!.capitalize()
                : "n/a",
            onPressed: () {
              Navigator.pushNamed(context, '/welcome_screen');
            },
          ),
          body: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: 500,
                width: 300,
                child: BlocBuilder<ThemeCubit, ThemeState>(
                  builder: (context, state) {
                    return CustomPaint(
                      painter: CustomSun(
                        color: Theme.of(context).colorScheme.secondary,
                        type: state.type,
                      ),
                    );
                  },
                ),
              ),
              BlocBuilder<ForecastCubit, ForecastState>(
                builder: (context, state) {
                  if (state is ForecastLoaded) {
                    List<Widget> pages = [
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
                            children: pages,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: ValueListenableBuilder(
                            valueListenable: currentIndexPage,
                            builder: (context, int currentIndexPage, child) {
                              return DotsIndicator(
                                dotsCount: pages.length,
                                position: currentIndexPage.toDouble(),
                                decorator: const DotsDecorator(
                                  activeColor: CustomTheme.onPrimary,
                                  color: Colors.transparent,
                                  shape: CircleBorder(
                                    side: BorderSide(
                                        color: CustomTheme.onPrimary),
                                  ),
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
            ],
          ),
        );
      },
    );
  }
}
