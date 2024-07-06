import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weatherapp/constants/strings.dart';
import 'package:weatherapp/models/weather_model.dart';

class WeatherService {
  static const _baseUrl = 'http://api.openweathermap.org/data/2.5/weather';

  Future<Weather> fetchWeather(String city) async {
    final response =
        await http.get(Uri.parse('$_baseUrl?q=$city&appid=$apiKey'));

    if (response.statusCode == 200) {
      return Weather.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
