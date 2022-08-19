import 'dart:convert';
import 'dart:math';

import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';

import '../../configuration/app_config.dart';
import '../../configuration/base_client.dart';
import '../../models/PassData/PassModel.dart';
import '../../models/PassData/PassTokenModel.dart';

class PassService extends GetxService {
  Future<List<PassModel>> getAllPasses() async {
    List<PassModel> passList = [];
    var response = await BaseClient().get(
      passUrl,
      "Pass",
    );
    if (response != null) {
      final jsonData = jsonDecode(response);
      var passData = jsonData["data"];
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
}
