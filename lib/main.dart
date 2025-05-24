import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wheater_app/core/router/app_router.dart';
import 'package:wheater_app/core/theme/app_theme.dart';
// Import your database provider if you initialize it here
// import 'package:flutter_weather_app/data/database/app_database.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  // Example: Initialize database instance here if needed globally early
  // final appDatabase = AppDatabase();

  runApp(
    ProviderScope(
      // overrides: [
      //   appDatabaseProvider.overrideWithValue(appDatabase), // If you create it here
      // ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider);
    return MaterialApp.router(
      title: 'Flutter Weather',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme, // Optional
      themeMode: ThemeMode.system, // Optional
      routerConfig: goRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}
