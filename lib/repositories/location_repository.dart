import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;
import 'package:http/http.dart' as http;
import 'package:my_weather_app/models/models.dart';
import 'custom_exceptions.dart';

class LocationRepository {
  static const String _appid = 'c2ea1029e318f2a91964e3dd51641fdb';

  Future<Location> getGeocodedLocation(
      {required double lat, required double lon, String lang = "en"}) async {
    const String _url = 'api.openweathermap.org';
    const String _path = '/geo/1.0/reverse';
    const String _limit = "1";

    final _queryParameters = {
      "lat": lat.toString(),
      "lon": lon.toString(),
      "limit:": _limit,
      "appid": _appid,
    };

    final Uri _uri = Uri.http(_url, _path, _queryParameters);

    try {
      final response = await http.get(_uri);
      switch (response.statusCode) {
        case 200:
          final String jsonData = response.body;
          final decodedJson = jsonDecode(jsonData);
          if (decodedJson.isEmpty) throw WrongLocalizationException();
          final Location location = Location.fromMap(decodedJson[0], lang);
          return location;
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

  Future<Location> getMockupGeocodedLocation({String lang = "en"}) async {
    return Future.delayed(
      const Duration(seconds: 2),
      () async {
        final String jsonData =
            await rootBundle.loadString('assets/json/geocoded_location.json');
        final decodedJson = jsonDecode(jsonData);
        final Location location = Location.fromMap(decodedJson[0], lang);
        return location;
      },
    );
  }

  Future<List<Location>> getNamedLocation(
      {required String q, int limit = 3, String lang = "en"}) async {
    const String _url = 'api.openweathermap.org';
    const String _path = '/geo/1.0/direct';

    final _queryParameters = {
      "q": q.toLowerCase(),
      "limit": limit.toString(),
      "appid": _appid,
    };

    final Uri _uri = Uri.http(_url, _path, _queryParameters);

    try {
      final response = await http.get(_uri);
      switch (response.statusCode) {
        case 200:
          final String jsonData = response.body;
          final decodedJson = jsonDecode(jsonData);
          List<Location> locations = List<Location>.from(
              decodedJson.map((x) => Location.fromMap(x, lang)));
          return locations;
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

  Future<List<Location>> getMockupNamedLocation({String lang = "en"}) async {
    return Future.delayed(
      const Duration(seconds: 2),
      () async {
        final String jsonData =
            await rootBundle.loadString('assets/json/named_location.json');
        final decodedJson = jsonDecode(jsonData);
        List<Location> locations = List<Location>.from(
            decodedJson.map((x) => Location.fromMap(x, lang)));
        return locations;
      },
    );
  }
}
