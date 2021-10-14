import 'dart:convert';

import 'package:http/http.dart';
import 'package:myprojects/flutter_maps/simple_google_map/quakes_map_app/model/quake.dart';

class Network {
  Future<Quake> getAllQuakes() async {
    var apiUrl =
        'https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/2.5_day.geojson';
    final response = await get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      print('Quake data: ${response.body}');
      return Quake.fromJson(json.decode(response.body));
    } else {
      throw Exception('error getting quakes');
    }
  }
}
