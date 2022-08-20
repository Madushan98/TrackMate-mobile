import 'dart:convert';

import 'package:covid_safe_app/models/PassData/PassHistoryModel.dart';
import 'package:covid_safe_app/models/PassData/PassLogModel.dart';
import 'package:covid_safe_app/models/PassData/PassVerifyModel.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import '../../configuration/app_config.dart';
import '../../configuration/base_client.dart';

class ScannerService extends GetxService {
  Future<PassVerifyModel> getPassVerifiedData(String passId) async {
    var token = await BaseClient().get(
      passUrl,
      "Pass/Verify?createPassRequest=$passId",
    );
    final jsonData = jsonDecode(token);
    var passVerificationData = PassVerifyModel.fromJson(jsonData);

    return passVerificationData;
  }


  Future<List<PassHistoryModel>> getPassHistoryData(String scannerId) async {
    var data = await BaseClient().get(
      passUrl,
      "PassLog-scanner/$scannerId",
    );
    final jsonData = jsonDecode(data);

    jsonData.forEach(element){

    }

    var passScanData = PassVerifyModel.fromJson(jsonData);

    return passVerificationData;
  }


  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }

  Future<bool> verifyUserScanning(PassLogModel passLogModel) async {
    try {
      var response = await BaseClient().post(passUrl, "PassLog", passLogModel);
      return true;
    } catch (e) {
      print(e);
    }

    return false;
  }
}
