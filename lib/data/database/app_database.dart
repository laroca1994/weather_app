import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
// Import your weather entity/model for Drift if different from API model
// For simplicity, we'll store parts of WeatherModel directly or a simplified version.
part 'app_database.g.dart';

// Define the table
@DataClassName('SavedWeatherData')
class SavedWeather extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get cityName => text()();
  TextColumn get country => text().nullable()();
  RealColumn get temperature => real()();
  RealColumn get tempMin => real()();
  RealColumn get tempMax => real()();
  TextColumn get weatherMain => text()(); // e.g. "Clouds"
  TextColumn get weatherDescription => text()();
  TextColumn get weatherIcon => text()();
  IntColumn get humidity => integer()();
  RealColumn get windSpeed => real()();
  DateTimeColumn get lastFetched => dateTime()(); // To know how old the data is
  TextColumn get fullJsonResponse => text()(); // Store the raw JSON for simplicity to re-parse
}

@DriftDatabase(tables: [SavedWeather])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  AppDatabase.test(super.e); // For testing

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'weather_db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}

// Provider for the database
final appDatabaseProvider = Provider<AppDatabase>((ref) {
  // Ensure this is a singleton. You might create it in main and override.
  return AppDatabase();
});

// --- DAO for Weather ---
// We can create a DAO in a separate file or here. For simplicity, here:
@DriftAccessor(tables: [SavedWeather])
class WeatherDao extends DatabaseAccessor<AppDatabase> with _$WeatherDaoMixin {
  WeatherDao(super.db);

  Future<List<SavedWeatherData>> getAllSearches() => select(savedWeather).get();
  
  Future<SavedWeatherData?> getWeatherByCityName(String cityName) {
    return (select(savedWeather)..where((tbl) => tbl.cityName.equals(cityName.toLowerCase())))
        .getSingleOrNull();
  }

  Future<int> insertWeather(SavedWeatherCompanion entry) {
    return into(savedWeather).insert(entry, mode: InsertMode.insertOrReplace);
  }

  Future<void> deleteWeather(SavedWeatherData entry) {
    return delete(savedWeather).delete(entry);
  }

  Future<void> clearAllWeather() {
    return delete(savedWeather).go();
  }
}

final weatherDaoProvider = Provider<WeatherDao>((ref) {
  final db = ref.watch(appDatabaseProvider);
  return WeatherDao(db);
});