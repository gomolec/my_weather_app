import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}

extension DateTimeExtension on DateTime {
  String getWeekdayString() {
    switch (weekday) {
      case 1:
        return 'monday';
      case 2:
        return 'tuesday';
      case 3:
        return 'wednesday';
      case 4:
        return 'thursday';
      case 5:
        return 'friday';
      case 6:
        return 'saturday';
      case 7:
        return 'sunday';
      default:
        return 'n/a';
    }
  }
}

IconData getIcon(String id) {
  switch (id) {
    case "01d":
      return LineAwesomeIcons.sun;
    case "01n":
      return LineAwesomeIcons.sun;
    case "02d":
      return LineAwesomeIcons.cloud_with_sun;
    case "02n":
      return LineAwesomeIcons.cloud_with_sun;
    case "03d":
      return LineAwesomeIcons.cloud;
    case "03n":
      return LineAwesomeIcons.cloud;
    case "04d":
      return LineAwesomeIcons.cloud;
    case "04n":
      return LineAwesomeIcons.cloud;
    case "09d":
      return LineAwesomeIcons.cloud_with_heavy_showers;
    case "09n":
      return LineAwesomeIcons.cloud_with_heavy_showers;
    case "10d":
      return LineAwesomeIcons.cloud_with_rain;
    case "10n":
      return LineAwesomeIcons.cloud_with_rain;
    case "11d":
      return LineAwesomeIcons.lightning_bolt;
    case "11n":
      return LineAwesomeIcons.lightning_bolt;
    case "13d":
      return LineAwesomeIcons.snowflake;
    case "13n":
      return LineAwesomeIcons.snowflake;
    case "50d":
      return LineAwesomeIcons.water;
    case "50n":
      return LineAwesomeIcons.water;
    default:
      return LineAwesomeIcons.times;
  }
}
