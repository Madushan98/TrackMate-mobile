import 'dart:convert';

import 'package:covid_safe_app/models/PassData/PassLogModel.dart';
import '../../configuration/app_config.dart';
import '../../configuration/base_client.dart';
import '../../models/PassData/PassHistoryModel.dart';

class LocationService {

  Future<List<PassHistoryModel>> getPassHistoryData(String userId,String date) async {
    List<PassHistoryModel> passHistoryList = [];
    var response = await BaseClient().get(
      passUrl,
      // "PassLog-user-date/$userId?dateTime=$date",
      "PassLog-user/$userId"
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
}