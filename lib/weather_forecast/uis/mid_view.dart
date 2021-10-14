import 'package:flutter/material.dart';
import 'package:myprojects/weather_forecast/models/weather_forecast_model.dart';
import 'package:myprojects/weather_forecast/utils/forecast_util.dart';

Widget midView(AsyncSnapshot<WeatherForecastModel> snapshot) {
// var forcastList = snapshot.data.list==false;
  Container midView = Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Text('${snapshot.data.city.name}, ${snapshot.data.city.country}'),
        //  Text('${Util.getFormattedDate(new DateTime.fromMillisecondsSinceEpoch(forcastList[0].dt*1000))}', style: TextStyle(fontSize: 15),),
        SizedBox(height: 10),
        Icon(Icons.wb_sunny, size: 195),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Text('${forcastList[0].temp.day.toStringAsFixed} *F',
              //style: TextStyle(fontSize: 34), )
              // Text('${foreCastList[0].weather[0].description.toUpperCase()}'),
            
            ],
            
          ),
          
        ),
      ],
    ),
  );
  return midView;
}
// I disabled anything that has data because I'm not able to get data from Api, i also set SNAPSHOTSHOT. HAS DATA to false so i can bypass the API call
