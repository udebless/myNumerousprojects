import 'dart:convert';

import 'package:http/http.dart';
import 'package:myprojects/weather_forecast/models/weather_forecast_model.dart';
import 'package:myprojects/weather_forecast/utils/forecast_util.dart';

class Network {
  Future<WeatherForecastModel> getWeatherForecast({String cityName}) async {
    var finalUrl = 'https://api.openweathermap.org/data/2.5/forecast/daily?q' +
        cityName +
        '&appid=' +
        Util.appId +
        '&units=imperial'; // chane to metric or imperial
    final response = await get(Uri.parse((finalUrl)));
    print('URL: ${Uri.parse(finalUrl)}');
    if (response.statusCode == 200) {
      print('Weather data : ${response.body}');
      return WeatherForecastModel.fromJson(json.decode(response.body));
      // we get the actual mapped object

    } else {
      throw Exception('Error getting weather forecast');
    }
  }
}
