import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/constants/colors.dart';
import 'package:weatherapp/constants/strings.dart';
import 'package:weatherapp/providers/weather_provider.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});
  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  Widget build(BuildContext context) {
    final weather = context.watch<WeatherViewModel>().weather;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          Strings.details,
          style: GoogleFonts.workSans(
              color: AppColors.blackColor,
              fontSize: 20.sp,
              fontWeight: FontWeight.w400),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () async {
              await context.read<WeatherViewModel>().refreshWeather();
            },
          ),
        ],
      ),
      body: weather == null
          ? const Center(
              child: CircularProgressIndicator(
              color: AppColors.primaryColor,
            ))
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      weather.cityName,
                      style: GoogleFonts.workSans(
                          fontSize: 32.sp, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      '${weather.temperature.toStringAsFixed(1)}°C',
                      style: GoogleFonts.workSans(
                          fontSize: 24.sp,
                          color: AppColors.blackColor,
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      weather.condition,
                      style: GoogleFonts.workSans(
                        fontSize: 24.sp,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Image.network(
                        'http://openweathermap.org/img/w/${weather.icon}.png'),
                    SizedBox(height: 16.h),
                    Text(
                      'Humidity: ${weather.humidity}%',
                      style: GoogleFonts.workSans(
                          color: AppColors.blackColor,
                          fontWeight: FontWeight.w300,
                          fontSize: 18.sp),
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      'Wind Speed: ${weather.windSpeed} m/s',
                      style: GoogleFonts.workSans(
                          color: AppColors.blackColor,
                          fontWeight: FontWeight.w300,
                          fontSize: 18.sp),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
