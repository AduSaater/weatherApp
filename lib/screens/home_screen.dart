import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/constants/colors.dart';
import 'package:weatherapp/constants/strings.dart';
import 'package:weatherapp/providers/weather_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Strings.appTitle,
          style: GoogleFonts.workSans(
            fontSize: 20.sp,
            color: AppColors.primaryColor,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 50,
                child: TextFormField(
                  controller: _controller,
                  decoration: InputDecoration(
                    labelText: 'Enter city name',
                    labelStyle: GoogleFonts.workSans(
                        color: AppColors.primaryColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600),
                    border: const OutlineInputBorder(),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.primaryColor),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Consumer<WeatherViewModel>(
                builder: (context, viewModel, child) {
                  return viewModel.isLoading
                      ? const CircularProgressIndicator(
                          color: AppColors.primaryColor,
                        )
                      : ElevatedButton(
                          onPressed: () async {
                            final cityName = _controller.text;
                            if (cityName.isNotEmpty) {
                              try {
                                await context
                                    .read<WeatherViewModel>()
                                    .fetchWeather(cityName);
                                Navigator.pushNamed(context, '/weather');
                              } catch (e) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text(e.toString()),
                                ));
                              }
                            }
                          },
                          child: Text(
                            'Get Weather',
                            style: GoogleFonts.workSans(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 16.sp),
                          ),
                        );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
