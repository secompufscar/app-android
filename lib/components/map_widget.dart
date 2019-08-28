import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

class MapWidget extends StatelessWidget {
  Completer<GoogleMapController> _controller = Completer();

  static const LatLng _center = const LatLng(-21.9813837, -47.8808764);
  LatLng _lastMapPosition = _center;

  static BitmapDescriptor _icon = BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan);

  final Set<Marker> _markers = {
    Marker(
      markerId: MarkerId("1"),
      position: LatLng(-21.979677, -47.880555),
      infoWindow: InfoWindow(
        title: 'Departamento de Computação',
        snippet: "alguma coisa",
      ),
      icon: _icon,
    ),
    Marker(
      markerId: MarkerId("2"),
      position: LatLng(-21.968744, -47.878109),
      infoWindow: InfoWindow(
        title: 'IFSP',
        snippet: "alguma coisa",
      ),
      icon: _icon,
    ),
    Marker(
      markerId: MarkerId("3"),
      position: LatLng(-21.983630, -47.881660),
      infoWindow: InfoWindow(
        title: 'Anfiteatro Bento Prado Júnior',
        snippet: "alguma coisa",
      ),
      icon: _icon,
    ),
    Marker(
      markerId: MarkerId("4"),
      position: LatLng(-21.982665, -47.883116),
      infoWindow: InfoWindow(
        title: 'Biblioteca Comunitária',
        snippet: "alguma coisa",
      ),
      icon: _icon,
    ),
  };

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  void _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 15.0,
        ),
        mapType: MapType.normal,
        markers: _markers,
        onCameraMove: _onCameraMove,
      ),
    );
  }
}
