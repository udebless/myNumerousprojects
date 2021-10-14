import 'package:flutter/material.dart';
import 'package:myprojects/weather_forecast/models/weather_forecast_model.dart';
import 'package:myprojects/weather_forecast/uis/forecast_card.dart';

Widget bottomView(
    AsyncSnapshot<WeatherForecastModel> snapshot, BuildContext context) {
  // var forecastList = snapshot.data.list;

  return Container(
    height: 170,
    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 10),
    child: ListView.separated(
      scrollDirection:Axis.horizontal ,
      
      separatorBuilder: (context, index) => SizedBox(
        width: 8,
      ),

      ///itemCount: forecastList.length,
      
      itemCount: 2,

      itemBuilder: (context, index) => ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        child: Container(
          width: MediaQuery.of(context).size.width / 2.7,
          height: 160,
          child: Text('fvdfswdwsedw'),
         // child: forecastCard(snapshot, index),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xff9661C3), Colors.white],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight)),
        ),
      ),
    ),
  );
}
