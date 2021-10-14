import 'package:flutter/material.dart';
import 'package:myprojects/weather_forecast/models/weather_forecast_model.dart';
import 'package:myprojects/weather_forecast/networks/network.dart';
import 'package:myprojects/weather_forecast/uis/mid_view.dart';

class WeatherForecast extends StatefulWidget {
  const WeatherForecast({Key key}) : super(key: key);

  @override
  _WeatherForecastState createState() => _WeatherForecastState();
}

class _WeatherForecastState extends State<WeatherForecast> {
  Future<WeatherForecastModel> forecastObject;
  String _cityName = 'Mumbai';

  @override
  void initState() {
    super.initState();
    forecastObject = Network().getWeatherForecast(cityName: _cityName);
    // forecastObject.then((weather) => {
    //   print(weather.city.country)
    // });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          textFieldView(),
          Container(
            child: FutureBuilder<WeatherForecastModel>(
              future: forecastObject,
              builder: (BuildContext context,
                  AsyncSnapshot<WeatherForecastModel> snapshot) {
                if (!snapshot.hasData) {
                  return Column(
                    children: [
                      midView(snapshot),
                    ],
                  );
                } else {
                  return Container(
                    child: Center(
                      child: LinearProgressIndicator(),
                    ),
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }

  Widget textFieldView() {
    return Container(
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Enter City Name',
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          contentPadding: EdgeInsets.all(8),
        ),
        onSubmitted: (value) {
          setState(() {
            _cityName = value;
            forecastObject = getWeather(_cityName);
          });
        },
      ),
    );
  }

  Future<WeatherForecastModel> getWeather(String cityName) => new Network().getWeatherForecast(cityName: _cityName);
}
