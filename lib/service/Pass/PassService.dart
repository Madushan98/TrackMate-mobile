import 'dart:convert';
import 'dart:math';

import 'package:covid_safe_app/models/PassData/NewPassModel.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';

import '../../configuration/app_config.dart';
import '../../configuration/base_client.dart';
import '../../models/PassData/PassHistoryModel.dart';
import '../../models/PassData/PassModel.dart';
import '../../models/PassData/PassTokenModel.dart';

class PassService extends GetxService {
  Future<List<PassModel>> getAllPasses(String userId) async {
    List<PassModel> passList = [];
    var response = await BaseClient().get(
      passUrl,
      "Pass-userid/$userId",
    );
    if (response != null) {
      final jsonData = jsonDecode(response);
      var passData = jsonData;
      passData.forEach((element) {
        passList.add(PassModel.fromJson(element));
      });
      return passList;
    }
    return [];
  }

  Future<String?> getPassToken(String passId) async {
    var token = await BaseClient().get(
      passUrl,
      "Pass/GetToken?createPassRequest=$passId",
    );
    final jsonData = jsonDecode(token);
    var passToken = PassTokenModel.fromJson(jsonData);

    return passToken.passToken;
  }

  Future<List<PassHistoryModel>> getPassHistoryData(String scannerId) async {
    List<PassHistoryModel> passHistoryList = [];
    var response = await BaseClient().get(
      passUrl,
      "PassLog-user/$scannerId",
    );
    if (response != null) {
      final jsonData = jsonDecode(response);
      var passData = jsonData;
      passData.forEach((element) {
        passHistoryList.add(PassHistoryModel.fromJson(element));
      });
      return passHistoryList;
    }
    return [];
  }

  Future<bool> createPass(NewPassModel passModel) async {
    try {
      var response = await BaseClient().post(
        passUrl,
        "Pass",
        passModel,
      );
      if (response != null) {
        return true;
      }
      return true;
    } catch (e) {
      print(e);

    }


    return false;
  }
}
