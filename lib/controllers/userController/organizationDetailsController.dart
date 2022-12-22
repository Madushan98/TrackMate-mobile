import 'dart:ui';
import 'package:covid_safe_app/models/Organzation/OrganizationModel.dart';
import 'package:covid_safe_app/models/User/updateOrganization.dart';
import 'package:covid_safe_app/screens/LoadingStatus.dart';
import 'package:covid_safe_app/models/PassData/NewPassModel.dart';
import 'package:covid_safe_app/service/Authentication/AuthService.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../models/User/UserModel.dart';
import '../../service/Pass/PassService.dart';
import '../../service/User/UserService.dart';
import '../accountController/account_controller.dart';

class OrganizationDataController extends GetxController {
  var isLoading = false.obs;
  var _authService = Get.find<AuthService>();
  var _userService = Get.find<UserService>();
  var _accountController =  Get.put(AccountController());
  var userID = "".obs;
  var organizationList = RxList<String>();
  var selectedOrganizationName = "".obs;
  var selectedOrganization = "".obs;
  var employeeNum = "".obs;
  var contactNo = "".obs;
  List<OrganizationModel> organizations = [];

  @override
  void onInit() {
    getUserDetails();
    getAllOrganizations();
    super.onInit();
  }

  getUserDetails() async {
    var userDetails = await _authService.getUserDetails();
    userID.value = userDetails.id!;
    update();
  }

  getAllOrganizations() async {
    organizations = await _userService.getAllOrganization();
    print(organizations);
    organizations.forEach((element) {
      organizationList.add(element.organizationName!);
    });
    update();
  }

  selectOrganization(String value) {
    organizations.forEach((element) {
      if (element.organizationName == value) {
        selectedOrganization.value = element.id!;
      }
    });
  }

  updateOrganizationDetails() async {
    isLoading.value = true;
    UpdateOrganization updateOrganization = UpdateOrganization(
        organizationId: selectedOrganization.value,
        userId: userID.value,
        employeeContactNo: contactNo.value,
        employeeNumber: int.parse(employeeNum.value));

    var response =
        await _userService.updateOrganizationData(updateOrganization);

    if (response) {
      _accountController.loadData();
      _accountController.update();
      isLoading.value = false;
      Get.back();
    } else {
      isLoading.value = false;
      LoadingStatus.showErroDialog(
          description: "Something went wrong", context: Get.context!);
    }
  }
}
