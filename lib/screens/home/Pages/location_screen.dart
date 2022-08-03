import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> _markers = {};
  bool isMapVisible = true;

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
            child: Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          child: GoogleMap(
            markers: _markers,
            mapType: MapType.normal,
            myLocationEnabled: true,
            initialCameraPosition: CameraPosition(
              target: LatLng(
                6.927079,
                79.861244,
              ),
              zoom: 8,
            ),
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);

              Timer(Duration(seconds: 1), () {
                setState(() {
                  isMapVisible = false;
                });
              });
            },
          ),
        ),
        Visibility(
          visible: isMapVisible,
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.grey[100],
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        )
      ],
    )));
  }
}
