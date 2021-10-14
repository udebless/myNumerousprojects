import 'package:flutter/material.dart';
import 'package:myprojects/weather_forecast/models/weather_forecast_model.dart';
import 'package:myprojects/weather_forecast/utils/forecast_util.dart';

Widget forecastCard(AsyncSnapshot<WeatherForecastModel> snapshot, int index) {
  // var forecastList = snapshot.hasData.list;
  var dayOfweek = '';
  //DateTime date = 
  // new DateTime.fromMillisecondsSinceEpoch(forecastList[index].dt * 1000);
  // var fullDate = Util.getFormattedDate(date);
  //dayOfweek = fullDate.split(',')[0];
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      
    ],
  );
}
