import 'dart:async';
import 'package:covid_safe_app/controllers/LocationController/location_controller.dart';
import 'package:covid_safe_app/screens/LoadingStatus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../models/PassData/PassHistoryModel.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  final _locationController = Get.put(LocationController());
  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> _markers = {};
  bool isMapVisible = true;
  bool _isloading = true;

  @override
  void initState() {
    getLocations();
    super.initState();
  }


  getLocations(){
    print(_locationController.passLogHistory.length);
    _locationController.passLogHistory.forEach((element) {
      double lat = element.latitude ?? 6.60006;
      double lang = element.longitude ?? 72.1313;
      print("$lat");
      _markers.add(Marker(
          markerId: MarkerId('id1 ${element.logTime}'),
          position:
          LatLng(lat, lang),
          infoWindow: InfoWindow(
              title: element.logTime,
              snippet: element.scannerId,
              onTap: () async {

              })));
    });
    if (mounted) {
      setState(() {
        _isloading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
            child: _isloading
                ? Container(
                color: Colors.white,
                child: CircularProgressIndicator())
                : Stack(
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
              zoom: 10,
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
