// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WeatherEntity {

 String get cityName; double get temperature; double get tempMin; double get tempMax; String get weatherMain; String get weatherDescription; String get weatherIcon; int get humidity; double get windSpeed; String? get country; DateTime? get lastFetched;// For UI to know how old the data is
// Add other fields as needed
 Coord? get coordinates;// For map integration or re-fetching
 int? get sunrise; int? get sunset; double? get feelsLike; String? get imageUrl; String? get fullJson;
/// Create a copy of WeatherEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WeatherEntityCopyWith<WeatherEntity> get copyWith => _$WeatherEntityCopyWithImpl<WeatherEntity>(this as WeatherEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeatherEntity&&(identical(other.cityName, cityName) || other.cityName == cityName)&&(identical(other.temperature, temperature) || other.temperature == temperature)&&(identical(other.tempMin, tempMin) || other.tempMin == tempMin)&&(identical(other.tempMax, tempMax) || other.tempMax == tempMax)&&(identical(other.weatherMain, weatherMain) || other.weatherMain == weatherMain)&&(identical(other.weatherDescription, weatherDescription) || other.weatherDescription == weatherDescription)&&(identical(other.weatherIcon, weatherIcon) || other.weatherIcon == weatherIcon)&&(identical(other.humidity, humidity) || other.humidity == humidity)&&(identical(other.windSpeed, windSpeed) || other.windSpeed == windSpeed)&&(identical(other.country, country) || other.country == country)&&(identical(other.lastFetched, lastFetched) || other.lastFetched == lastFetched)&&(identical(other.coordinates, coordinates) || other.coordinates == coordinates)&&(identical(other.sunrise, sunrise) || other.sunrise == sunrise)&&(identical(other.sunset, sunset) || other.sunset == sunset)&&(identical(other.feelsLike, feelsLike) || other.feelsLike == feelsLike)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.fullJson, fullJson) || other.fullJson == fullJson));
}


@override
int get hashCode => Object.hash(runtimeType,cityName,temperature,tempMin,tempMax,weatherMain,weatherDescription,weatherIcon,humidity,windSpeed,country,lastFetched,coordinates,sunrise,sunset,feelsLike,imageUrl,fullJson);

@override
String toString() {
  return 'WeatherEntity(cityName: $cityName, temperature: $temperature, tempMin: $tempMin, tempMax: $tempMax, weatherMain: $weatherMain, weatherDescription: $weatherDescription, weatherIcon: $weatherIcon, humidity: $humidity, windSpeed: $windSpeed, country: $country, lastFetched: $lastFetched, coordinates: $coordinates, sunrise: $sunrise, sunset: $sunset, feelsLike: $feelsLike, imageUrl: $imageUrl, fullJson: $fullJson)';
}


}

/// @nodoc
abstract mixin class $WeatherEntityCopyWith<$Res>  {
  factory $WeatherEntityCopyWith(WeatherEntity value, $Res Function(WeatherEntity) _then) = _$WeatherEntityCopyWithImpl;
@useResult
$Res call({
 String cityName, double temperature, double tempMin, double tempMax, String weatherMain, String weatherDescription, String weatherIcon, int humidity, double windSpeed, String? country, DateTime? lastFetched, Coord? coordinates, int? sunrise, int? sunset, double? feelsLike, String? imageUrl, String? fullJson
});


$CoordCopyWith<$Res>? get coordinates;

}
/// @nodoc
class _$WeatherEntityCopyWithImpl<$Res>
    implements $WeatherEntityCopyWith<$Res> {
  _$WeatherEntityCopyWithImpl(this._self, this._then);

  final WeatherEntity _self;
  final $Res Function(WeatherEntity) _then;

/// Create a copy of WeatherEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? cityName = null,Object? temperature = null,Object? tempMin = null,Object? tempMax = null,Object? weatherMain = null,Object? weatherDescription = null,Object? weatherIcon = null,Object? humidity = null,Object? windSpeed = null,Object? country = freezed,Object? lastFetched = freezed,Object? coordinates = freezed,Object? sunrise = freezed,Object? sunset = freezed,Object? feelsLike = freezed,Object? imageUrl = freezed,Object? fullJson = freezed,}) {
  return _then(_self.copyWith(
cityName: null == cityName ? _self.cityName : cityName // ignore: cast_nullable_to_non_nullable
as String,temperature: null == temperature ? _self.temperature : temperature // ignore: cast_nullable_to_non_nullable
as double,tempMin: null == tempMin ? _self.tempMin : tempMin // ignore: cast_nullable_to_non_nullable
as double,tempMax: null == tempMax ? _self.tempMax : tempMax // ignore: cast_nullable_to_non_nullable
as double,weatherMain: null == weatherMain ? _self.weatherMain : weatherMain // ignore: cast_nullable_to_non_nullable
as String,weatherDescription: null == weatherDescription ? _self.weatherDescription : weatherDescription // ignore: cast_nullable_to_non_nullable
as String,weatherIcon: null == weatherIcon ? _self.weatherIcon : weatherIcon // ignore: cast_nullable_to_non_nullable
as String,humidity: null == humidity ? _self.humidity : humidity // ignore: cast_nullable_to_non_nullable
as int,windSpeed: null == windSpeed ? _self.windSpeed : windSpeed // ignore: cast_nullable_to_non_nullable
as double,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String?,lastFetched: freezed == lastFetched ? _self.lastFetched : lastFetched // ignore: cast_nullable_to_non_nullable
as DateTime?,coordinates: freezed == coordinates ? _self.coordinates : coordinates // ignore: cast_nullable_to_non_nullable
as Coord?,sunrise: freezed == sunrise ? _self.sunrise : sunrise // ignore: cast_nullable_to_non_nullable
as int?,sunset: freezed == sunset ? _self.sunset : sunset // ignore: cast_nullable_to_non_nullable
as int?,feelsLike: freezed == feelsLike ? _self.feelsLike : feelsLike // ignore: cast_nullable_to_non_nullable
as double?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,fullJson: freezed == fullJson ? _self.fullJson : fullJson // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of WeatherEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CoordCopyWith<$Res>? get coordinates {
    if (_self.coordinates == null) {
    return null;
  }

  return $CoordCopyWith<$Res>(_self.coordinates!, (value) {
    return _then(_self.copyWith(coordinates: value));
  });
}
}


/// @nodoc


class _WeatherEntity extends WeatherEntity {
  const _WeatherEntity({required this.cityName, required this.temperature, required this.tempMin, required this.tempMax, required this.weatherMain, required this.weatherDescription, required this.weatherIcon, required this.humidity, required this.windSpeed, this.country, this.lastFetched, this.coordinates, this.sunrise, this.sunset, this.feelsLike, this.imageUrl, this.fullJson}): super._();
  

@override final  String cityName;
@override final  double temperature;
@override final  double tempMin;
@override final  double tempMax;
@override final  String weatherMain;
@override final  String weatherDescription;
@override final  String weatherIcon;
@override final  int humidity;
@override final  double windSpeed;
@override final  String? country;
@override final  DateTime? lastFetched;
// For UI to know how old the data is
// Add other fields as needed
@override final  Coord? coordinates;
// For map integration or re-fetching
@override final  int? sunrise;
@override final  int? sunset;
@override final  double? feelsLike;
@override final  String? imageUrl;
@override final  String? fullJson;

/// Create a copy of WeatherEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WeatherEntityCopyWith<_WeatherEntity> get copyWith => __$WeatherEntityCopyWithImpl<_WeatherEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WeatherEntity&&(identical(other.cityName, cityName) || other.cityName == cityName)&&(identical(other.temperature, temperature) || other.temperature == temperature)&&(identical(other.tempMin, tempMin) || other.tempMin == tempMin)&&(identical(other.tempMax, tempMax) || other.tempMax == tempMax)&&(identical(other.weatherMain, weatherMain) || other.weatherMain == weatherMain)&&(identical(other.weatherDescription, weatherDescription) || other.weatherDescription == weatherDescription)&&(identical(other.weatherIcon, weatherIcon) || other.weatherIcon == weatherIcon)&&(identical(other.humidity, humidity) || other.humidity == humidity)&&(identical(other.windSpeed, windSpeed) || other.windSpeed == windSpeed)&&(identical(other.country, country) || other.country == country)&&(identical(other.lastFetched, lastFetched) || other.lastFetched == lastFetched)&&(identical(other.coordinates, coordinates) || other.coordinates == coordinates)&&(identical(other.sunrise, sunrise) || other.sunrise == sunrise)&&(identical(other.sunset, sunset) || other.sunset == sunset)&&(identical(other.feelsLike, feelsLike) || other.feelsLike == feelsLike)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.fullJson, fullJson) || other.fullJson == fullJson));
}


@override
int get hashCode => Object.hash(runtimeType,cityName,temperature,tempMin,tempMax,weatherMain,weatherDescription,weatherIcon,humidity,windSpeed,country,lastFetched,coordinates,sunrise,sunset,feelsLike,imageUrl,fullJson);

@override
String toString() {
  return 'WeatherEntity(cityName: $cityName, temperature: $temperature, tempMin: $tempMin, tempMax: $tempMax, weatherMain: $weatherMain, weatherDescription: $weatherDescription, weatherIcon: $weatherIcon, humidity: $humidity, windSpeed: $windSpeed, country: $country, lastFetched: $lastFetched, coordinates: $coordinates, sunrise: $sunrise, sunset: $sunset, feelsLike: $feelsLike, imageUrl: $imageUrl, fullJson: $fullJson)';
}


}

/// @nodoc
abstract mixin class _$WeatherEntityCopyWith<$Res> implements $WeatherEntityCopyWith<$Res> {
  factory _$WeatherEntityCopyWith(_WeatherEntity value, $Res Function(_WeatherEntity) _then) = __$WeatherEntityCopyWithImpl;
@override @useResult
$Res call({
 String cityName, double temperature, double tempMin, double tempMax, String weatherMain, String weatherDescription, String weatherIcon, int humidity, double windSpeed, String? country, DateTime? lastFetched, Coord? coordinates, int? sunrise, int? sunset, double? feelsLike, String? imageUrl, String? fullJson
});


@override $CoordCopyWith<$Res>? get coordinates;

}
/// @nodoc
class __$WeatherEntityCopyWithImpl<$Res>
    implements _$WeatherEntityCopyWith<$Res> {
  __$WeatherEntityCopyWithImpl(this._self, this._then);

  final _WeatherEntity _self;
  final $Res Function(_WeatherEntity) _then;

/// Create a copy of WeatherEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? cityName = null,Object? temperature = null,Object? tempMin = null,Object? tempMax = null,Object? weatherMain = null,Object? weatherDescription = null,Object? weatherIcon = null,Object? humidity = null,Object? windSpeed = null,Object? country = freezed,Object? lastFetched = freezed,Object? coordinates = freezed,Object? sunrise = freezed,Object? sunset = freezed,Object? feelsLike = freezed,Object? imageUrl = freezed,Object? fullJson = freezed,}) {
  return _then(_WeatherEntity(
cityName: null == cityName ? _self.cityName : cityName // ignore: cast_nullable_to_non_nullable
as String,temperature: null == temperature ? _self.temperature : temperature // ignore: cast_nullable_to_non_nullable
as double,tempMin: null == tempMin ? _self.tempMin : tempMin // ignore: cast_nullable_to_non_nullable
as double,tempMax: null == tempMax ? _self.tempMax : tempMax // ignore: cast_nullable_to_non_nullable
as double,weatherMain: null == weatherMain ? _self.weatherMain : weatherMain // ignore: cast_nullable_to_non_nullable
as String,weatherDescription: null == weatherDescription ? _self.weatherDescription : weatherDescription // ignore: cast_nullable_to_non_nullable
as String,weatherIcon: null == weatherIcon ? _self.weatherIcon : weatherIcon // ignore: cast_nullable_to_non_nullable
as String,humidity: null == humidity ? _self.humidity : humidity // ignore: cast_nullable_to_non_nullable
as int,windSpeed: null == windSpeed ? _self.windSpeed : windSpeed // ignore: cast_nullable_to_non_nullable
as double,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String?,lastFetched: freezed == lastFetched ? _self.lastFetched : lastFetched // ignore: cast_nullable_to_non_nullable
as DateTime?,coordinates: freezed == coordinates ? _self.coordinates : coordinates // ignore: cast_nullable_to_non_nullable
as Coord?,sunrise: freezed == sunrise ? _self.sunrise : sunrise // ignore: cast_nullable_to_non_nullable
as int?,sunset: freezed == sunset ? _self.sunset : sunset // ignore: cast_nullable_to_non_nullable
as int?,feelsLike: freezed == feelsLike ? _self.feelsLike : feelsLike // ignore: cast_nullable_to_non_nullable
as double?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,fullJson: freezed == fullJson ? _self.fullJson : fullJson // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of WeatherEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CoordCopyWith<$Res>? get coordinates {
    if (_self.coordinates == null) {
    return null;
  }

  return $CoordCopyWith<$Res>(_self.coordinates!, (value) {
    return _then(_self.copyWith(coordinates: value));
  });
}
}

// dart format on
