import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;
import 'package:http/http.dart' as http;
import 'package:my_weather_app/models/models.dart';
import 'custom_exceptions.dart';

class ForecastRepository {
  static const String _appid = 'c2ea1029e318f2a91964e3dd51641fdb';

  Future<Forecast> getForecast(
      {required double lat,
      required double lon,
      String units = "metric",
      String lang = "en"}) async {
    const String url = 'api.openweathermap.org';
    const String path = '/data/2.5/onecall';
    const String exclude = "minutely,alerts";

    final queryParameters = {
      "lat": lat.toString(),
      "lon": lon.toString(),
      "exclude": exclude,
      "units": units,
      "lang": lang,
      "appid": _appid,
    };

    final Uri uri = Uri.https(url, path, queryParameters);

    try {
      final response = await http.get(uri);
      switch (response.statusCode) {
        case 200:
          final String jsonData = response.body;
          final Forecast forecast = Forecast.fromJson(jsonData);
          return forecast;
        case 401:
          throw UnauthorisedException(response.body.toString());
        case 404:
          throw BadRequestException(response.body.toString());
        default:
          throw FetchDataException(
              'Error occured while Communication with Server with StatusCode: ${response.statusCode}');
      }
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  Future<Forecast> getMockupForecast() async {
    return Future.delayed(
      const Duration(seconds: 2),
      () async {
        final String jsonData =
            await rootBundle.loadString('assets/json/forecast.json');
        final Forecast forecast = Forecast.fromJson(jsonData);
        return forecast;
      },
    );
  }
}
