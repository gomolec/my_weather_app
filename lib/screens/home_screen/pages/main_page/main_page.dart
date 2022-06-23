import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_weather_app/extensions.dart';
import 'package:my_weather_app/models/models.dart';
import 'components/components.dart';

class MainPage extends StatelessWidget {
  final Forecast forecast;

  const MainPage({
    Key? key,
    required this.forecast,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            DateFormat('dd MMMM yyyy, hh:mm').format(forecast.current.dt!),
            style: Theme.of(context)
                .textTheme
                .caption!
                .copyWith(fontWeight: FontWeight.w600),
          ),
          MainForecastText(
            weekDay: forecast.current.dt!.getWeekdayString(),
            forecastText: forecast.current.weather.description!,
            temp: forecast.current.temp ?? 0.0,
          ),
          Column(
            children: List.generate(
              6,
              (index) => Builder(
                builder: (context) {
                  Daily dailyForecast = forecast.daily[index + 1];
                  return ForecastTableTile(
                    weekDay: dailyForecast.dt!.getWeekdayString(),
                    icon: getIcon(dailyForecast.weather.icon ?? ""),
                    maxTemp: dailyForecast.temp.max ?? 0.0,
                    minTemp: dailyForecast.temp.min ?? 0.0,
                  );
                },
              ),
            ),
          ),
          const SizedBox(
            height: 16.0,
          )
        ],
      ),
    );
  }
}
