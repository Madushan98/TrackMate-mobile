import 'dart:async';
import 'package:covid_safe_app/controllers/LocationController/location_controller.dart';
import 'package:covid_safe_app/helper/dateTime.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../controllers/passControllers/user_pass_history_controller.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  final _userHistoryController = Get.put(UserPassHistoryController());
  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> _markers = {};
  bool isMapVisible = true;
  bool _isloading = true;
  Set<Polyline> _polyline = Set<Polyline>();
  List<LatLng> _polylineCoordinates = [];
  late PolylinePoints polyLinePoints;
  DateTime selectedDate = DateTime.now();
  List<LatLng> latLen = [
    LatLng(19.0759837, 72.8776559),
    LatLng(28.679079, 77.069710),
    LatLng(26.850000, 80.949997),
    LatLng(24.879999, 74.629997),
    LatLng(16.166700, 74.833298),
    LatLng(12.971599, 77.594563),
  ];
  @override
  void initState() {
   polyLinePoints = PolylinePoints();
    getLocations();
    super.initState();
  }

  getLocations() async {
    _isloading = true;
    await _userHistoryController.getScanHistoryData();
    _userHistoryController.selectedDateLogHistory.forEach((element) {
      double? lat = element.longitude?.toPrecision(6);
      double? lang = element.latitude?.toPrecision(6);
      _markers.add(Marker(
          markerId: MarkerId('id1 ${element.logTime}'),
          position: LatLng(lat!, lang!),
          infoWindow: InfoWindow(
              title: getTimeString(element.logTime!),
              snippet: element.passId,
              onTap: () async {})));
    });

    if (mounted) {
      setState(() {
        _isloading = false;
      });
    }
  }

  updateLocations() async {
    _isloading = true;
    _userHistoryController.getSelectedDateLogHistory();
    _userHistoryController.selectedDateLogHistory.forEach((element) {
      double? lat = element.longitude?.toPrecision(6);
      double? lang = element.latitude?.toPrecision(6);
      _markers.add(Marker(
          markerId: MarkerId('id1 ${element.logTime}'),
          position: LatLng(lat!, lang!),
          infoWindow: InfoWindow(
              title: getTimeString(element.logTime!),
              snippet: element.passId,
              onTap: () async {})));
    });

    if (mounted) {
      setState(() {
        _isloading = false;
      });
    }
  }

  selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _userHistoryController.selectedDate.value,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        _markers.clear();
        _userHistoryController.selectedDate.value = picked;
        updateLocations();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;

    if (_isloading) {
      return Scaffold(
        body: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Container(
              height: _size.height * 0.8,
              width: _size.height,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    color: Colors.grey[900],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    } else {
      return Scaffold(
        body: SafeArea(
            child: _isloading
                ? Container(
                    color: Colors.white, child: CircularProgressIndicator())
                : Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: GoogleMap(
                          markers: _markers,
                          polylines: _polyline,
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

                            Timer(Duration(seconds: 2), () {
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
                  )),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
          child: FloatingActionButton(
              backgroundColor: Colors.lightBlue,
              foregroundColor: Colors.black,
              onPressed: () {
                selectDate(context);
              },
              child: Icon(Icons.calendar_today)),
        ),
      );
    }
  }

  Future<void> setPolylines(PointLatLng source, PointLatLng destination) async {
    PolylineResult result = await polyLinePoints.getRouteBetweenCoordinates(
        "AIzaSyCpGqoDnzbyTlJr3aX1wGD3qjrwcrbbqgM", source, destination);

    if (result.status == 'OK') {
      result.points.forEach((PointLatLng point) {
        _polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }
      _polyline.add(Polyline(
          polylineId: PolylineId('poly'),
          color: Colors.red,
          points: _polylineCoordinates));

  }
}
