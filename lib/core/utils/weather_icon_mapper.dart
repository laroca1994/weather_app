import 'package:flutter/material.dart';

// Basic mapper, expand as needed.
// OpenWeatherMap icons: https://openweathermap.org/weather-conditions
// You can use NetworkImage for `http://openweathermap.org/img/wn/ICON_CODE@2x.png`
// Or map to local assets or font icons.

Widget getWeatherIcon(String iconCode, {double size = 50}) {
  // Using NetworkImage directly for simplicity
  String iconUrl = 'https://openweathermap.org/img/wn/$iconCode@2x.png';
  return Image.network(
    iconUrl,
    width: size,
    height: size,
    errorBuilder: (context, error, stackTrace) => Icon(Icons.wb_cloudy, size: size), // Fallback
  );

  // Example mapping to Material Icons (less accurate)
  /*
  switch (iconCode.substring(0, 2)) {
    case '01': // clear sky
      return Icon(Icons.wb_sunny, color: Colors.yellow, size: size);
    case '02': // few clouds
    case '03': // scattered clouds
    case '04': // broken clouds
      return Icon(Icons.wb_cloudy, color: Colors.grey, size: size);
    case '09': // shower rain
    case '10': // rain
      return Icon(Icons.beach_access, color: Colors.blue, size: size); // Or custom rain icon
    case '11': // thunderstorm
      return Icon(Icons.flash_on, color: Colors.yellowAccent, size: size);
    case '13': // snow
      return Icon(Icons.ac_unit, color: Colors.lightBlueAccent, size: size);
    case '50': // mist
      return Icon(Icons.blur_on, color: Colors.grey[300], size: size);
    default:
      return Icon(Icons.help_outline, size: size);
  }
  */
}