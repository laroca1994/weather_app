// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WeatherModel _$WeatherModelFromJson(Map<String, dynamic> json) =>
    _WeatherModel(
      coord:
          json['coord'] == null
              ? null
              : Coord.fromJson(json['coord'] as Map<String, dynamic>),
      weather:
          (json['weather'] as List<dynamic>?)
              ?.map((e) => Weather.fromJson(e as Map<String, dynamic>))
              .toList(),
      base: json['base'] as String?,
      main:
          json['main'] == null
              ? null
              : Main.fromJson(json['main'] as Map<String, dynamic>),
      visibility: (json['visibility'] as num?)?.toInt(),
      wind:
          json['wind'] == null
              ? null
              : Wind.fromJson(json['wind'] as Map<String, dynamic>),
      rain:
          json['rain'] == null
              ? null
              : Rain.fromJson(json['rain'] as Map<String, dynamic>),
      clouds:
          json['clouds'] == null
              ? null
              : Clouds.fromJson(json['clouds'] as Map<String, dynamic>),
      dt: (json['dt'] as num?)?.toInt(),
      sys:
          json['sys'] == null
              ? null
              : Sys.fromJson(json['sys'] as Map<String, dynamic>),
      timezone: (json['timezone'] as num?)?.toInt(),
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      cod: (json['cod'] as num?)?.toInt(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$WeatherModelToJson(_WeatherModel instance) =>
    <String, dynamic>{
      'coord': instance.coord,
      'weather': instance.weather,
      'base': instance.base,
      'main': instance.main,
      'visibility': instance.visibility,
      'wind': instance.wind,
      'rain': instance.rain,
      'clouds': instance.clouds,
      'dt': instance.dt,
      'sys': instance.sys,
      'timezone': instance.timezone,
      'id': instance.id,
      'name': instance.name,
      'cod': instance.cod,
      'message': instance.message,
    };

_Coord _$CoordFromJson(Map<String, dynamic> json) => _Coord(
  lon: (json['lon'] as num?)?.toDouble(),
  lat: (json['lat'] as num?)?.toDouble(),
);

Map<String, dynamic> _$CoordToJson(_Coord instance) => <String, dynamic>{
  'lon': instance.lon,
  'lat': instance.lat,
};

_Weather _$WeatherFromJson(Map<String, dynamic> json) => _Weather(
  id: (json['id'] as num?)?.toInt(),
  main: json['main'] as String?,
  description: json['description'] as String?,
  icon: json['icon'] as String?,
);

Map<String, dynamic> _$WeatherToJson(_Weather instance) => <String, dynamic>{
  'id': instance.id,
  'main': instance.main,
  'description': instance.description,
  'icon': instance.icon,
};

_Main _$MainFromJson(Map<String, dynamic> json) => _Main(
  temp: (json['temp'] as num?)?.toDouble(),
  feelsLike: (json['feels_like'] as num?)?.toDouble(),
  tempMin: (json['temp_min'] as num?)?.toDouble(),
  tempMax: (json['temp_max'] as num?)?.toDouble(),
  pressure: (json['pressure'] as num?)?.toInt(),
  humidity: (json['humidity'] as num?)?.toInt(),
  seaLevel: (json['sea_level'] as num?)?.toInt(),
  grndLevel: (json['grnd_level'] as num?)?.toInt(),
);

Map<String, dynamic> _$MainToJson(_Main instance) => <String, dynamic>{
  'temp': instance.temp,
  'feels_like': instance.feelsLike,
  'temp_min': instance.tempMin,
  'temp_max': instance.tempMax,
  'pressure': instance.pressure,
  'humidity': instance.humidity,
  'sea_level': instance.seaLevel,
  'grnd_level': instance.grndLevel,
};

_Wind _$WindFromJson(Map<String, dynamic> json) => _Wind(
  speed: (json['speed'] as num?)?.toDouble(),
  deg: (json['deg'] as num?)?.toInt(),
  gust: (json['gust'] as num?)?.toDouble(),
);

Map<String, dynamic> _$WindToJson(_Wind instance) => <String, dynamic>{
  'speed': instance.speed,
  'deg': instance.deg,
  'gust': instance.gust,
};

_Rain _$RainFromJson(Map<String, dynamic> json) =>
    _Rain(oneHour: (json['1h'] as num?)?.toDouble());

Map<String, dynamic> _$RainToJson(_Rain instance) => <String, dynamic>{
  '1h': instance.oneHour,
};

_Clouds _$CloudsFromJson(Map<String, dynamic> json) =>
    _Clouds(all: (json['all'] as num?)?.toInt());

Map<String, dynamic> _$CloudsToJson(_Clouds instance) => <String, dynamic>{
  'all': instance.all,
};

_Sys _$SysFromJson(Map<String, dynamic> json) => _Sys(
  type: (json['type'] as num?)?.toInt(),
  id: (json['id'] as num?)?.toInt(),
  country: json['country'] as String?,
  sunrise: (json['sunrise'] as num?)?.toInt(),
  sunset: (json['sunset'] as num?)?.toInt(),
);

Map<String, dynamic> _$SysToJson(_Sys instance) => <String, dynamic>{
  'type': instance.type,
  'id': instance.id,
  'country': instance.country,
  'sunrise': instance.sunrise,
  'sunset': instance.sunset,
};
