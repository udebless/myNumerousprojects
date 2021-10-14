import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:myprojects/flutter_maps/simple_google_map/quakes_map_app/network/network.dart';

import 'model/quake.dart';

class QuakesApp extends StatefulWidget {
  const QuakesApp({Key key}) : super(key: key);

  @override
  _QuakesAppState createState() => _QuakesAppState();
}

class _QuakesAppState extends State<QuakesApp> {
  Future<Quake> _quakeData;
  Completer<GoogleMapController> _controller = Completer();
  List<Marker> _makerList = <Marker>[];

  @override
  void initState() {
    super.initState();
    _quakeData = Network().getAllQuakes();
    _quakeData.then(
        (value) => {print('Place: ${value.features[0].properties.place}')});
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildGooglemap(context),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: findQuakes(),
        label: Text('find quakes!'),
        icon: Icon(Icons.place),
      ),
    );
  }

  Widget _buildGooglemap(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.height,
      child: GoogleMap(
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        initialCameraPosition:
            CameraPosition(target: LatLng(36.1083333, -117.8608333), zoom: 3),
            markers:Set<Marker>.of(_makerList),
      ),
    );
  }

  findQuakes() {
    setState(() {
      _makerList.clear();
      _handleResponse(); // clear thr map in the begining
    });
  }

  void _handleResponse() {
    setState(() {
      _quakeData.then((quake) => {
            quake.features.forEach((quake)=> {
              _makerList.add(Marker(markerId: MarkerId(quake.id),
              infoWindow: InfoWindow(title: quake.properties.mag.toString(), snippet: quake.properties.title),

              icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueMagenta),
              position: LatLng(quake.geometry.coordinates[1], quake.geometry.coordinates[0] ),
              onTap: (){}
              ))
            })
          });
    });
  }
}
