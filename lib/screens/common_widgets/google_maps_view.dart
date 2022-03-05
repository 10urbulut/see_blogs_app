import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapsView extends StatefulWidget {
  const GoogleMapsView({
    Key? key,
  }) : super(key: key);

  @override
  State<GoogleMapsView> createState() => _GoogleMapsViewState();
}

class _GoogleMapsViewState extends State<GoogleMapsView> {
  static const CameraPosition _position = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(41.6176025, 32.3478626),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  late GoogleMapController controller;

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.normal,
      // ignore: avoid_print
      onTap: (value) => print(value),
      initialCameraPosition: const CameraPosition(target: LatLng(35, 19)),
      myLocationEnabled: true,
      myLocationButtonEnabled: true,
      markers: _createMarker(),
      onMapCreated: (map) async {
        controller = map;

        await _createMarkerImageFromAsset();
      },
    );
  }

  BitmapDescriptor? locationIcon;

  Future<void> _createMarkerImageFromAsset() async {
    if (locationIcon == null) {
      final ImageConfiguration imageConfiguration =
          createLocalImageConfiguration(context);
      var bitmap = await BitmapDescriptor.fromAssetImage(
          imageConfiguration, 'assets/images/location.png');
      setState(() => locationIcon = bitmap);
    } else {}
  }

  Set<Marker> _createMarker() {
    return <Marker>{
      Marker(
          markerId: const MarkerId("id"),
          zIndex: 10,
          position: _position.target,
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
          visible: true)
    };
  }
}
