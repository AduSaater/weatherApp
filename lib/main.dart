import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/constants/strings.dart';
import 'package:weatherapp/providers/weather_provider.dart';
import 'package:weatherapp/screens/home_screen.dart';
import 'package:weatherapp/screens/preload/preload.dart';
import 'package:weatherapp/screens/weather_deatials_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(390, 844),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return ChangeNotifierProvider(
            create: (_) => WeatherViewModel()..loadLastCity(),
            child: MaterialApp(
              title: Strings.appTitle,
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              initialRoute: '/',
              routes: {
                '/': (context) => const PreloadScreen(),
                '/home': (context) => const HomeScreen(),
                '/weather': (context) => const WeatherScreen(),
              },
            ),
          );
        });
  }
}
