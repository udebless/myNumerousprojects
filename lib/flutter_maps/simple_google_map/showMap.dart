import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ShowSimpleMap extends StatefulWidget {
  const ShowSimpleMap({Key key}) : super(key: key);

  @override
  _ShowSimpleMapState createState() => _ShowSimpleMapState();
}

class _ShowSimpleMapState extends State<ShowSimpleMap> {
  GoogleMapController Mapcontroller;
  static final LatLng _center = const LatLng(6.465422, 3.406448);
  static final LatLng _anotherMarker = const LatLng(9.0338725, 8.677457);
  void _onMapCreated(GoogleMapController controller) {
    Mapcontroller = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Maps'),
      ),
      body: GoogleMap(
          markers: {enuguMarker},
          onMapCreated: _onMapCreated,
          mapType: MapType.terrain,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
          )),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToIntel,
        label: Text('Intel Coorp!'),
        icon: Icon(Icons.place),
      ),
    );
  }

  static final intelPosition = CameraPosition(target: LatLng(9.0738496,7.4649147),
  zoom: 14.780, bearing: 191.78, tilt: 35.98);

  
  Future<void> _goToIntel() async {
    final GoogleMapController controller = await Mapcontroller;
    controller.animateCamera(CameraUpdate.newCameraPosition(intelPosition));
  }

  Marker nigeriaMarker = Marker(
    markerId: MarkerId('Nigeria'),
    position: _center,
    infoWindow: InfoWindow(title: 'Lagos, Nigeria'),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueMagenta),
  );

  Marker enuguMarker = Marker(
    markerId: MarkerId('Nigeria'),
    position: _anotherMarker,
    infoWindow: InfoWindow(title: 'Enugu, Nigeria'),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueMagenta),
  );
}
