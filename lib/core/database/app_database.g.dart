// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $SavedWeatherTable extends SavedWeather
    with TableInfo<$SavedWeatherTable, SavedWeatherData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SavedWeatherTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _cityNameMeta = const VerificationMeta(
    'cityName',
  );
  @override
  late final GeneratedColumn<String> cityName = GeneratedColumn<String>(
    'city_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _countryMeta = const VerificationMeta(
    'country',
  );
  @override
  late final GeneratedColumn<String> country = GeneratedColumn<String>(
    'country',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _temperatureMeta = const VerificationMeta(
    'temperature',
  );
  @override
  late final GeneratedColumn<double> temperature = GeneratedColumn<double>(
    'temperature',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tempMinMeta = const VerificationMeta(
    'tempMin',
  );
  @override
  late final GeneratedColumn<double> tempMin = GeneratedColumn<double>(
    'temp_min',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tempMaxMeta = const VerificationMeta(
    'tempMax',
  );
  @override
  late final GeneratedColumn<double> tempMax = GeneratedColumn<double>(
    'temp_max',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _weatherMainMeta = const VerificationMeta(
    'weatherMain',
  );
  @override
  late final GeneratedColumn<String> weatherMain = GeneratedColumn<String>(
    'weather_main',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _weatherDescriptionMeta =
      const VerificationMeta('weatherDescription');
  @override
  late final GeneratedColumn<String> weatherDescription =
      GeneratedColumn<String>(
        'weather_description',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _weatherIconMeta = const VerificationMeta(
    'weatherIcon',
  );
  @override
  late final GeneratedColumn<String> weatherIcon = GeneratedColumn<String>(
    'weather_icon',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _humidityMeta = const VerificationMeta(
    'humidity',
  );
  @override
  late final GeneratedColumn<int> humidity = GeneratedColumn<int>(
    'humidity',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _windSpeedMeta = const VerificationMeta(
    'windSpeed',
  );
  @override
  late final GeneratedColumn<double> windSpeed = GeneratedColumn<double>(
    'wind_speed',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lastFetchedMeta = const VerificationMeta(
    'lastFetched',
  );
  @override
  late final GeneratedColumn<DateTime> lastFetched = GeneratedColumn<DateTime>(
    'last_fetched',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fullJsonResponseMeta = const VerificationMeta(
    'fullJsonResponse',
  );
  @override
  late final GeneratedColumn<String> fullJsonResponse = GeneratedColumn<String>(
    'full_json_response',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _imageUrlMeta = const VerificationMeta(
    'imageUrl',
  );
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
    'image_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isDefaultMeta = const VerificationMeta(
    'isDefault',
  );
  @override
  late final GeneratedColumn<bool> isDefault = GeneratedColumn<bool>(
    'is_default',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_default" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    cityName,
    country,
    temperature,
    tempMin,
    tempMax,
    weatherMain,
    weatherDescription,
    weatherIcon,
    humidity,
    windSpeed,
    lastFetched,
    fullJsonResponse,
    imageUrl,
    isDefault,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'saved_weather';
  @override
  VerificationContext validateIntegrity(
    Insertable<SavedWeatherData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('city_name')) {
      context.handle(
        _cityNameMeta,
        cityName.isAcceptableOrUnknown(data['city_name']!, _cityNameMeta),
      );
    } else if (isInserting) {
      context.missing(_cityNameMeta);
    }
    if (data.containsKey('country')) {
      context.handle(
        _countryMeta,
        country.isAcceptableOrUnknown(data['country']!, _countryMeta),
      );
    }
    if (data.containsKey('temperature')) {
      context.handle(
        _temperatureMeta,
        temperature.isAcceptableOrUnknown(
          data['temperature']!,
          _temperatureMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_temperatureMeta);
    }
    if (data.containsKey('temp_min')) {
      context.handle(
        _tempMinMeta,
        tempMin.isAcceptableOrUnknown(data['temp_min']!, _tempMinMeta),
      );
    } else if (isInserting) {
      context.missing(_tempMinMeta);
    }
    if (data.containsKey('temp_max')) {
      context.handle(
        _tempMaxMeta,
        tempMax.isAcceptableOrUnknown(data['temp_max']!, _tempMaxMeta),
      );
    } else if (isInserting) {
      context.missing(_tempMaxMeta);
    }
    if (data.containsKey('weather_main')) {
      context.handle(
        _weatherMainMeta,
        weatherMain.isAcceptableOrUnknown(
          data['weather_main']!,
          _weatherMainMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_weatherMainMeta);
    }
    if (data.containsKey('weather_description')) {
      context.handle(
        _weatherDescriptionMeta,
        weatherDescription.isAcceptableOrUnknown(
          data['weather_description']!,
          _weatherDescriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_weatherDescriptionMeta);
    }
    if (data.containsKey('weather_icon')) {
      context.handle(
        _weatherIconMeta,
        weatherIcon.isAcceptableOrUnknown(
          data['weather_icon']!,
          _weatherIconMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_weatherIconMeta);
    }
    if (data.containsKey('humidity')) {
      context.handle(
        _humidityMeta,
        humidity.isAcceptableOrUnknown(data['humidity']!, _humidityMeta),
      );
    } else if (isInserting) {
      context.missing(_humidityMeta);
    }
    if (data.containsKey('wind_speed')) {
      context.handle(
        _windSpeedMeta,
        windSpeed.isAcceptableOrUnknown(data['wind_speed']!, _windSpeedMeta),
      );
    } else if (isInserting) {
      context.missing(_windSpeedMeta);
    }
    if (data.containsKey('last_fetched')) {
      context.handle(
        _lastFetchedMeta,
        lastFetched.isAcceptableOrUnknown(
          data['last_fetched']!,
          _lastFetchedMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_lastFetchedMeta);
    }
    if (data.containsKey('full_json_response')) {
      context.handle(
        _fullJsonResponseMeta,
        fullJsonResponse.isAcceptableOrUnknown(
          data['full_json_response']!,
          _fullJsonResponseMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_fullJsonResponseMeta);
    }
    if (data.containsKey('image_url')) {
      context.handle(
        _imageUrlMeta,
        imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta),
      );
    }
    if (data.containsKey('is_default')) {
      context.handle(
        _isDefaultMeta,
        isDefault.isAcceptableOrUnknown(data['is_default']!, _isDefaultMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SavedWeatherData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SavedWeatherData(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      cityName:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}city_name'],
          )!,
      country: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}country'],
      ),
      temperature:
          attachedDatabase.typeMapping.read(
            DriftSqlType.double,
            data['${effectivePrefix}temperature'],
          )!,
      tempMin:
          attachedDatabase.typeMapping.read(
            DriftSqlType.double,
            data['${effectivePrefix}temp_min'],
          )!,
      tempMax:
          attachedDatabase.typeMapping.read(
            DriftSqlType.double,
            data['${effectivePrefix}temp_max'],
          )!,
      weatherMain:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}weather_main'],
          )!,
      weatherDescription:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}weather_description'],
          )!,
      weatherIcon:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}weather_icon'],
          )!,
      humidity:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}humidity'],
          )!,
      windSpeed:
          attachedDatabase.typeMapping.read(
            DriftSqlType.double,
            data['${effectivePrefix}wind_speed'],
          )!,
      lastFetched:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}last_fetched'],
          )!,
      fullJsonResponse:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}full_json_response'],
          )!,
      imageUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_url'],
      ),
      isDefault:
          attachedDatabase.typeMapping.read(
            DriftSqlType.bool,
            data['${effectivePrefix}is_default'],
          )!,
    );
  }

  @override
  $SavedWeatherTable createAlias(String alias) {
    return $SavedWeatherTable(attachedDatabase, alias);
  }
}

class SavedWeatherData extends DataClass
    implements Insertable<SavedWeatherData> {
  final int id;
  final String cityName;
  final String? country;
  final double temperature;
  final double tempMin;
  final double tempMax;
  final String weatherMain;
  final String weatherDescription;
  final String weatherIcon;
  final int humidity;
  final double windSpeed;
  final DateTime lastFetched;
  final String fullJsonResponse;
  final String? imageUrl;
  final bool isDefault;
  const SavedWeatherData({
    required this.id,
    required this.cityName,
    this.country,
    required this.temperature,
    required this.tempMin,
    required this.tempMax,
    required this.weatherMain,
    required this.weatherDescription,
    required this.weatherIcon,
    required this.humidity,
    required this.windSpeed,
    required this.lastFetched,
    required this.fullJsonResponse,
    this.imageUrl,
    required this.isDefault,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['city_name'] = Variable<String>(cityName);
    if (!nullToAbsent || country != null) {
      map['country'] = Variable<String>(country);
    }
    map['temperature'] = Variable<double>(temperature);
    map['temp_min'] = Variable<double>(tempMin);
    map['temp_max'] = Variable<double>(tempMax);
    map['weather_main'] = Variable<String>(weatherMain);
    map['weather_description'] = Variable<String>(weatherDescription);
    map['weather_icon'] = Variable<String>(weatherIcon);
    map['humidity'] = Variable<int>(humidity);
    map['wind_speed'] = Variable<double>(windSpeed);
    map['last_fetched'] = Variable<DateTime>(lastFetched);
    map['full_json_response'] = Variable<String>(fullJsonResponse);
    if (!nullToAbsent || imageUrl != null) {
      map['image_url'] = Variable<String>(imageUrl);
    }
    map['is_default'] = Variable<bool>(isDefault);
    return map;
  }

  SavedWeatherCompanion toCompanion(bool nullToAbsent) {
    return SavedWeatherCompanion(
      id: Value(id),
      cityName: Value(cityName),
      country:
          country == null && nullToAbsent
              ? const Value.absent()
              : Value(country),
      temperature: Value(temperature),
      tempMin: Value(tempMin),
      tempMax: Value(tempMax),
      weatherMain: Value(weatherMain),
      weatherDescription: Value(weatherDescription),
      weatherIcon: Value(weatherIcon),
      humidity: Value(humidity),
      windSpeed: Value(windSpeed),
      lastFetched: Value(lastFetched),
      fullJsonResponse: Value(fullJsonResponse),
      imageUrl:
          imageUrl == null && nullToAbsent
              ? const Value.absent()
              : Value(imageUrl),
      isDefault: Value(isDefault),
    );
  }

  factory SavedWeatherData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SavedWeatherData(
      id: serializer.fromJson<int>(json['id']),
      cityName: serializer.fromJson<String>(json['cityName']),
      country: serializer.fromJson<String?>(json['country']),
      temperature: serializer.fromJson<double>(json['temperature']),
      tempMin: serializer.fromJson<double>(json['tempMin']),
      tempMax: serializer.fromJson<double>(json['tempMax']),
      weatherMain: serializer.fromJson<String>(json['weatherMain']),
      weatherDescription: serializer.fromJson<String>(
        json['weatherDescription'],
      ),
      weatherIcon: serializer.fromJson<String>(json['weatherIcon']),
      humidity: serializer.fromJson<int>(json['humidity']),
      windSpeed: serializer.fromJson<double>(json['windSpeed']),
      lastFetched: serializer.fromJson<DateTime>(json['lastFetched']),
      fullJsonResponse: serializer.fromJson<String>(json['fullJsonResponse']),
      imageUrl: serializer.fromJson<String?>(json['imageUrl']),
      isDefault: serializer.fromJson<bool>(json['isDefault']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'cityName': serializer.toJson<String>(cityName),
      'country': serializer.toJson<String?>(country),
      'temperature': serializer.toJson<double>(temperature),
      'tempMin': serializer.toJson<double>(tempMin),
      'tempMax': serializer.toJson<double>(tempMax),
      'weatherMain': serializer.toJson<String>(weatherMain),
      'weatherDescription': serializer.toJson<String>(weatherDescription),
      'weatherIcon': serializer.toJson<String>(weatherIcon),
      'humidity': serializer.toJson<int>(humidity),
      'windSpeed': serializer.toJson<double>(windSpeed),
      'lastFetched': serializer.toJson<DateTime>(lastFetched),
      'fullJsonResponse': serializer.toJson<String>(fullJsonResponse),
      'imageUrl': serializer.toJson<String?>(imageUrl),
      'isDefault': serializer.toJson<bool>(isDefault),
    };
  }

  SavedWeatherData copyWith({
    int? id,
    String? cityName,
    Value<String?> country = const Value.absent(),
    double? temperature,
    double? tempMin,
    double? tempMax,
    String? weatherMain,
    String? weatherDescription,
    String? weatherIcon,
    int? humidity,
    double? windSpeed,
    DateTime? lastFetched,
    String? fullJsonResponse,
    Value<String?> imageUrl = const Value.absent(),
    bool? isDefault,
  }) => SavedWeatherData(
    id: id ?? this.id,
    cityName: cityName ?? this.cityName,
    country: country.present ? country.value : this.country,
    temperature: temperature ?? this.temperature,
    tempMin: tempMin ?? this.tempMin,
    tempMax: tempMax ?? this.tempMax,
    weatherMain: weatherMain ?? this.weatherMain,
    weatherDescription: weatherDescription ?? this.weatherDescription,
    weatherIcon: weatherIcon ?? this.weatherIcon,
    humidity: humidity ?? this.humidity,
    windSpeed: windSpeed ?? this.windSpeed,
    lastFetched: lastFetched ?? this.lastFetched,
    fullJsonResponse: fullJsonResponse ?? this.fullJsonResponse,
    imageUrl: imageUrl.present ? imageUrl.value : this.imageUrl,
    isDefault: isDefault ?? this.isDefault,
  );
  SavedWeatherData copyWithCompanion(SavedWeatherCompanion data) {
    return SavedWeatherData(
      id: data.id.present ? data.id.value : this.id,
      cityName: data.cityName.present ? data.cityName.value : this.cityName,
      country: data.country.present ? data.country.value : this.country,
      temperature:
          data.temperature.present ? data.temperature.value : this.temperature,
      tempMin: data.tempMin.present ? data.tempMin.value : this.tempMin,
      tempMax: data.tempMax.present ? data.tempMax.value : this.tempMax,
      weatherMain:
          data.weatherMain.present ? data.weatherMain.value : this.weatherMain,
      weatherDescription:
          data.weatherDescription.present
              ? data.weatherDescription.value
              : this.weatherDescription,
      weatherIcon:
          data.weatherIcon.present ? data.weatherIcon.value : this.weatherIcon,
      humidity: data.humidity.present ? data.humidity.value : this.humidity,
      windSpeed: data.windSpeed.present ? data.windSpeed.value : this.windSpeed,
      lastFetched:
          data.lastFetched.present ? data.lastFetched.value : this.lastFetched,
      fullJsonResponse:
          data.fullJsonResponse.present
              ? data.fullJsonResponse.value
              : this.fullJsonResponse,
      imageUrl: data.imageUrl.present ? data.imageUrl.value : this.imageUrl,
      isDefault: data.isDefault.present ? data.isDefault.value : this.isDefault,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SavedWeatherData(')
          ..write('id: $id, ')
          ..write('cityName: $cityName, ')
          ..write('country: $country, ')
          ..write('temperature: $temperature, ')
          ..write('tempMin: $tempMin, ')
          ..write('tempMax: $tempMax, ')
          ..write('weatherMain: $weatherMain, ')
          ..write('weatherDescription: $weatherDescription, ')
          ..write('weatherIcon: $weatherIcon, ')
          ..write('humidity: $humidity, ')
          ..write('windSpeed: $windSpeed, ')
          ..write('lastFetched: $lastFetched, ')
          ..write('fullJsonResponse: $fullJsonResponse, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('isDefault: $isDefault')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    cityName,
    country,
    temperature,
    tempMin,
    tempMax,
    weatherMain,
    weatherDescription,
    weatherIcon,
    humidity,
    windSpeed,
    lastFetched,
    fullJsonResponse,
    imageUrl,
    isDefault,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SavedWeatherData &&
          other.id == this.id &&
          other.cityName == this.cityName &&
          other.country == this.country &&
          other.temperature == this.temperature &&
          other.tempMin == this.tempMin &&
          other.tempMax == this.tempMax &&
          other.weatherMain == this.weatherMain &&
          other.weatherDescription == this.weatherDescription &&
          other.weatherIcon == this.weatherIcon &&
          other.humidity == this.humidity &&
          other.windSpeed == this.windSpeed &&
          other.lastFetched == this.lastFetched &&
          other.fullJsonResponse == this.fullJsonResponse &&
          other.imageUrl == this.imageUrl &&
          other.isDefault == this.isDefault);
}

class SavedWeatherCompanion extends UpdateCompanion<SavedWeatherData> {
  final Value<int> id;
  final Value<String> cityName;
  final Value<String?> country;
  final Value<double> temperature;
  final Value<double> tempMin;
  final Value<double> tempMax;
  final Value<String> weatherMain;
  final Value<String> weatherDescription;
  final Value<String> weatherIcon;
  final Value<int> humidity;
  final Value<double> windSpeed;
  final Value<DateTime> lastFetched;
  final Value<String> fullJsonResponse;
  final Value<String?> imageUrl;
  final Value<bool> isDefault;
  const SavedWeatherCompanion({
    this.id = const Value.absent(),
    this.cityName = const Value.absent(),
    this.country = const Value.absent(),
    this.temperature = const Value.absent(),
    this.tempMin = const Value.absent(),
    this.tempMax = const Value.absent(),
    this.weatherMain = const Value.absent(),
    this.weatherDescription = const Value.absent(),
    this.weatherIcon = const Value.absent(),
    this.humidity = const Value.absent(),
    this.windSpeed = const Value.absent(),
    this.lastFetched = const Value.absent(),
    this.fullJsonResponse = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.isDefault = const Value.absent(),
  });
  SavedWeatherCompanion.insert({
    this.id = const Value.absent(),
    required String cityName,
    this.country = const Value.absent(),
    required double temperature,
    required double tempMin,
    required double tempMax,
    required String weatherMain,
    required String weatherDescription,
    required String weatherIcon,
    required int humidity,
    required double windSpeed,
    required DateTime lastFetched,
    required String fullJsonResponse,
    this.imageUrl = const Value.absent(),
    this.isDefault = const Value.absent(),
  }) : cityName = Value(cityName),
       temperature = Value(temperature),
       tempMin = Value(tempMin),
       tempMax = Value(tempMax),
       weatherMain = Value(weatherMain),
       weatherDescription = Value(weatherDescription),
       weatherIcon = Value(weatherIcon),
       humidity = Value(humidity),
       windSpeed = Value(windSpeed),
       lastFetched = Value(lastFetched),
       fullJsonResponse = Value(fullJsonResponse);
  static Insertable<SavedWeatherData> custom({
    Expression<int>? id,
    Expression<String>? cityName,
    Expression<String>? country,
    Expression<double>? temperature,
    Expression<double>? tempMin,
    Expression<double>? tempMax,
    Expression<String>? weatherMain,
    Expression<String>? weatherDescription,
    Expression<String>? weatherIcon,
    Expression<int>? humidity,
    Expression<double>? windSpeed,
    Expression<DateTime>? lastFetched,
    Expression<String>? fullJsonResponse,
    Expression<String>? imageUrl,
    Expression<bool>? isDefault,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (cityName != null) 'city_name': cityName,
      if (country != null) 'country': country,
      if (temperature != null) 'temperature': temperature,
      if (tempMin != null) 'temp_min': tempMin,
      if (tempMax != null) 'temp_max': tempMax,
      if (weatherMain != null) 'weather_main': weatherMain,
      if (weatherDescription != null) 'weather_description': weatherDescription,
      if (weatherIcon != null) 'weather_icon': weatherIcon,
      if (humidity != null) 'humidity': humidity,
      if (windSpeed != null) 'wind_speed': windSpeed,
      if (lastFetched != null) 'last_fetched': lastFetched,
      if (fullJsonResponse != null) 'full_json_response': fullJsonResponse,
      if (imageUrl != null) 'image_url': imageUrl,
      if (isDefault != null) 'is_default': isDefault,
    });
  }

  SavedWeatherCompanion copyWith({
    Value<int>? id,
    Value<String>? cityName,
    Value<String?>? country,
    Value<double>? temperature,
    Value<double>? tempMin,
    Value<double>? tempMax,
    Value<String>? weatherMain,
    Value<String>? weatherDescription,
    Value<String>? weatherIcon,
    Value<int>? humidity,
    Value<double>? windSpeed,
    Value<DateTime>? lastFetched,
    Value<String>? fullJsonResponse,
    Value<String?>? imageUrl,
    Value<bool>? isDefault,
  }) {
    return SavedWeatherCompanion(
      id: id ?? this.id,
      cityName: cityName ?? this.cityName,
      country: country ?? this.country,
      temperature: temperature ?? this.temperature,
      tempMin: tempMin ?? this.tempMin,
      tempMax: tempMax ?? this.tempMax,
      weatherMain: weatherMain ?? this.weatherMain,
      weatherDescription: weatherDescription ?? this.weatherDescription,
      weatherIcon: weatherIcon ?? this.weatherIcon,
      humidity: humidity ?? this.humidity,
      windSpeed: windSpeed ?? this.windSpeed,
      lastFetched: lastFetched ?? this.lastFetched,
      fullJsonResponse: fullJsonResponse ?? this.fullJsonResponse,
      imageUrl: imageUrl ?? this.imageUrl,
      isDefault: isDefault ?? this.isDefault,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (cityName.present) {
      map['city_name'] = Variable<String>(cityName.value);
    }
    if (country.present) {
      map['country'] = Variable<String>(country.value);
    }
    if (temperature.present) {
      map['temperature'] = Variable<double>(temperature.value);
    }
    if (tempMin.present) {
      map['temp_min'] = Variable<double>(tempMin.value);
    }
    if (tempMax.present) {
      map['temp_max'] = Variable<double>(tempMax.value);
    }
    if (weatherMain.present) {
      map['weather_main'] = Variable<String>(weatherMain.value);
    }
    if (weatherDescription.present) {
      map['weather_description'] = Variable<String>(weatherDescription.value);
    }
    if (weatherIcon.present) {
      map['weather_icon'] = Variable<String>(weatherIcon.value);
    }
    if (humidity.present) {
      map['humidity'] = Variable<int>(humidity.value);
    }
    if (windSpeed.present) {
      map['wind_speed'] = Variable<double>(windSpeed.value);
    }
    if (lastFetched.present) {
      map['last_fetched'] = Variable<DateTime>(lastFetched.value);
    }
    if (fullJsonResponse.present) {
      map['full_json_response'] = Variable<String>(fullJsonResponse.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    if (isDefault.present) {
      map['is_default'] = Variable<bool>(isDefault.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SavedWeatherCompanion(')
          ..write('id: $id, ')
          ..write('cityName: $cityName, ')
          ..write('country: $country, ')
          ..write('temperature: $temperature, ')
          ..write('tempMin: $tempMin, ')
          ..write('tempMax: $tempMax, ')
          ..write('weatherMain: $weatherMain, ')
          ..write('weatherDescription: $weatherDescription, ')
          ..write('weatherIcon: $weatherIcon, ')
          ..write('humidity: $humidity, ')
          ..write('windSpeed: $windSpeed, ')
          ..write('lastFetched: $lastFetched, ')
          ..write('fullJsonResponse: $fullJsonResponse, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('isDefault: $isDefault')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $SavedWeatherTable savedWeather = $SavedWeatherTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [savedWeather];
}

typedef $$SavedWeatherTableCreateCompanionBuilder =
    SavedWeatherCompanion Function({
      Value<int> id,
      required String cityName,
      Value<String?> country,
      required double temperature,
      required double tempMin,
      required double tempMax,
      required String weatherMain,
      required String weatherDescription,
      required String weatherIcon,
      required int humidity,
      required double windSpeed,
      required DateTime lastFetched,
      required String fullJsonResponse,
      Value<String?> imageUrl,
      Value<bool> isDefault,
    });
typedef $$SavedWeatherTableUpdateCompanionBuilder =
    SavedWeatherCompanion Function({
      Value<int> id,
      Value<String> cityName,
      Value<String?> country,
      Value<double> temperature,
      Value<double> tempMin,
      Value<double> tempMax,
      Value<String> weatherMain,
      Value<String> weatherDescription,
      Value<String> weatherIcon,
      Value<int> humidity,
      Value<double> windSpeed,
      Value<DateTime> lastFetched,
      Value<String> fullJsonResponse,
      Value<String?> imageUrl,
      Value<bool> isDefault,
    });

class $$SavedWeatherTableFilterComposer
    extends Composer<_$AppDatabase, $SavedWeatherTable> {
  $$SavedWeatherTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cityName => $composableBuilder(
    column: $table.cityName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get country => $composableBuilder(
    column: $table.country,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get temperature => $composableBuilder(
    column: $table.temperature,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get tempMin => $composableBuilder(
    column: $table.tempMin,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get tempMax => $composableBuilder(
    column: $table.tempMax,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get weatherMain => $composableBuilder(
    column: $table.weatherMain,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get weatherDescription => $composableBuilder(
    column: $table.weatherDescription,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get weatherIcon => $composableBuilder(
    column: $table.weatherIcon,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get humidity => $composableBuilder(
    column: $table.humidity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get windSpeed => $composableBuilder(
    column: $table.windSpeed,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastFetched => $composableBuilder(
    column: $table.lastFetched,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fullJsonResponse => $composableBuilder(
    column: $table.fullJsonResponse,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isDefault => $composableBuilder(
    column: $table.isDefault,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SavedWeatherTableOrderingComposer
    extends Composer<_$AppDatabase, $SavedWeatherTable> {
  $$SavedWeatherTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cityName => $composableBuilder(
    column: $table.cityName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get country => $composableBuilder(
    column: $table.country,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get temperature => $composableBuilder(
    column: $table.temperature,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get tempMin => $composableBuilder(
    column: $table.tempMin,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get tempMax => $composableBuilder(
    column: $table.tempMax,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get weatherMain => $composableBuilder(
    column: $table.weatherMain,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get weatherDescription => $composableBuilder(
    column: $table.weatherDescription,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get weatherIcon => $composableBuilder(
    column: $table.weatherIcon,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get humidity => $composableBuilder(
    column: $table.humidity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get windSpeed => $composableBuilder(
    column: $table.windSpeed,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastFetched => $composableBuilder(
    column: $table.lastFetched,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fullJsonResponse => $composableBuilder(
    column: $table.fullJsonResponse,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isDefault => $composableBuilder(
    column: $table.isDefault,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SavedWeatherTableAnnotationComposer
    extends Composer<_$AppDatabase, $SavedWeatherTable> {
  $$SavedWeatherTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get cityName =>
      $composableBuilder(column: $table.cityName, builder: (column) => column);

  GeneratedColumn<String> get country =>
      $composableBuilder(column: $table.country, builder: (column) => column);

  GeneratedColumn<double> get temperature => $composableBuilder(
    column: $table.temperature,
    builder: (column) => column,
  );

  GeneratedColumn<double> get tempMin =>
      $composableBuilder(column: $table.tempMin, builder: (column) => column);

  GeneratedColumn<double> get tempMax =>
      $composableBuilder(column: $table.tempMax, builder: (column) => column);

  GeneratedColumn<String> get weatherMain => $composableBuilder(
    column: $table.weatherMain,
    builder: (column) => column,
  );

  GeneratedColumn<String> get weatherDescription => $composableBuilder(
    column: $table.weatherDescription,
    builder: (column) => column,
  );

  GeneratedColumn<String> get weatherIcon => $composableBuilder(
    column: $table.weatherIcon,
    builder: (column) => column,
  );

  GeneratedColumn<int> get humidity =>
      $composableBuilder(column: $table.humidity, builder: (column) => column);

  GeneratedColumn<double> get windSpeed =>
      $composableBuilder(column: $table.windSpeed, builder: (column) => column);

  GeneratedColumn<DateTime> get lastFetched => $composableBuilder(
    column: $table.lastFetched,
    builder: (column) => column,
  );

  GeneratedColumn<String> get fullJsonResponse => $composableBuilder(
    column: $table.fullJsonResponse,
    builder: (column) => column,
  );

  GeneratedColumn<String> get imageUrl =>
      $composableBuilder(column: $table.imageUrl, builder: (column) => column);

  GeneratedColumn<bool> get isDefault =>
      $composableBuilder(column: $table.isDefault, builder: (column) => column);
}

class $$SavedWeatherTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SavedWeatherTable,
          SavedWeatherData,
          $$SavedWeatherTableFilterComposer,
          $$SavedWeatherTableOrderingComposer,
          $$SavedWeatherTableAnnotationComposer,
          $$SavedWeatherTableCreateCompanionBuilder,
          $$SavedWeatherTableUpdateCompanionBuilder,
          (
            SavedWeatherData,
            BaseReferences<_$AppDatabase, $SavedWeatherTable, SavedWeatherData>,
          ),
          SavedWeatherData,
          PrefetchHooks Function()
        > {
  $$SavedWeatherTableTableManager(_$AppDatabase db, $SavedWeatherTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$SavedWeatherTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$SavedWeatherTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () =>
                  $$SavedWeatherTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> cityName = const Value.absent(),
                Value<String?> country = const Value.absent(),
                Value<double> temperature = const Value.absent(),
                Value<double> tempMin = const Value.absent(),
                Value<double> tempMax = const Value.absent(),
                Value<String> weatherMain = const Value.absent(),
                Value<String> weatherDescription = const Value.absent(),
                Value<String> weatherIcon = const Value.absent(),
                Value<int> humidity = const Value.absent(),
                Value<double> windSpeed = const Value.absent(),
                Value<DateTime> lastFetched = const Value.absent(),
                Value<String> fullJsonResponse = const Value.absent(),
                Value<String?> imageUrl = const Value.absent(),
                Value<bool> isDefault = const Value.absent(),
              }) => SavedWeatherCompanion(
                id: id,
                cityName: cityName,
                country: country,
                temperature: temperature,
                tempMin: tempMin,
                tempMax: tempMax,
                weatherMain: weatherMain,
                weatherDescription: weatherDescription,
                weatherIcon: weatherIcon,
                humidity: humidity,
                windSpeed: windSpeed,
                lastFetched: lastFetched,
                fullJsonResponse: fullJsonResponse,
                imageUrl: imageUrl,
                isDefault: isDefault,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String cityName,
                Value<String?> country = const Value.absent(),
                required double temperature,
                required double tempMin,
                required double tempMax,
                required String weatherMain,
                required String weatherDescription,
                required String weatherIcon,
                required int humidity,
                required double windSpeed,
                required DateTime lastFetched,
                required String fullJsonResponse,
                Value<String?> imageUrl = const Value.absent(),
                Value<bool> isDefault = const Value.absent(),
              }) => SavedWeatherCompanion.insert(
                id: id,
                cityName: cityName,
                country: country,
                temperature: temperature,
                tempMin: tempMin,
                tempMax: tempMax,
                weatherMain: weatherMain,
                weatherDescription: weatherDescription,
                weatherIcon: weatherIcon,
                humidity: humidity,
                windSpeed: windSpeed,
                lastFetched: lastFetched,
                fullJsonResponse: fullJsonResponse,
                imageUrl: imageUrl,
                isDefault: isDefault,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SavedWeatherTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SavedWeatherTable,
      SavedWeatherData,
      $$SavedWeatherTableFilterComposer,
      $$SavedWeatherTableOrderingComposer,
      $$SavedWeatherTableAnnotationComposer,
      $$SavedWeatherTableCreateCompanionBuilder,
      $$SavedWeatherTableUpdateCompanionBuilder,
      (
        SavedWeatherData,
        BaseReferences<_$AppDatabase, $SavedWeatherTable, SavedWeatherData>,
      ),
      SavedWeatherData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$SavedWeatherTableTableManager get savedWeather =>
      $$SavedWeatherTableTableManager(_db, _db.savedWeather);
}

mixin _$WeatherDaoMixin on DatabaseAccessor<AppDatabase> {
  $SavedWeatherTable get savedWeather => attachedDatabase.savedWeather;
}
