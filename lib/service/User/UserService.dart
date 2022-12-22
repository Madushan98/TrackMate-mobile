import 'dart:convert';
import 'package:covid_safe_app/configuration/app_config.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import '../../configuration/base_client.dart';
import '../../models/Organzation/OrganizationModel.dart';
import '../../models/User/updateOrganization.dart';

class UserService extends GetxService {
  Future<List<OrganizationModel>> getAllOrganization() async {
    List<OrganizationModel> organizationList = [];
    var response = await BaseClient().get(
      organizationUrl,
      "Organization",
    );
    if (response != null) {
      final jsonData = jsonDecode(response);
      var organizationData = jsonData;
      print(organizationData['data']);
      organizationData["data"].forEach((element) {
        organizationList.add(OrganizationModel.fromJson(element));
      });
      return organizationList;
    }
    return [];
  }


  Future<bool> updateOrganizationData(UpdateOrganization updateOrganization) async {
    try {
      var response = await BaseClient().put(
        userUrl,
        "user/update-organization",
         updateOrganization,
      );
      if (response != null) {
        return true;
      }
    } catch (e) {
      print(e);
    }

    return false;
  }

}
