import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:weatherapp/models/weather_model.dart';
import 'package:weatherapp/services/weather_service.dart';

class WeatherViewModel extends ChangeNotifier {
  Weather? _weather;
  Weather? get weather => _weather;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  final WeatherService _weatherService = WeatherService();

  Future<void> fetchWeather(String city) async {
    _setLoading(true);
    try {
      _weather = await _weatherService.fetchWeather(city);
      await _saveCity(city);
    } catch (e) {
      throw Exception('Failed to fetch weather data: $e');
    } finally {
      _setLoading(false);
      notifyListeners();
    }
  }

  Future<void> refreshWeather() async {
    if (_weather != null) {
      await fetchWeather(_weather!.cityName);
    }
  }

  Future<void> _saveCity(String city) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('lastCity', city);
  }

  Future<void> loadLastCity() async {
    final prefs = await SharedPreferences.getInstance();
    final city = prefs.getString('lastCity');
    if (city != null) {
      await fetchWeather(city);
    }
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
