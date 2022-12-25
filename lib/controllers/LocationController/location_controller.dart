import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/PassData/PassHistoryModel.dart';
import '../../service/Authentication/AuthService.dart';
import '../../service/Location/LocationService.dart';
import '../../service/Pass/PassService.dart';

class LocationController extends GetxController {
  var isLoading = false.obs;
  var _locationService = Get.find<LocationService>();
  var passLogHistory = RxList<PassHistoryModel>();
  var _authService = Get.find<AuthService>();
  var selectedDate = DateTime.now().obs;
  var selectedDateLogHistory = RxList<PassHistoryModel>();
  var _passService = Get.find<PassService>();
  @override
  void onInit() {
    getScanHistoryData();
    super.onInit();
  }

  getScanHistoryData() async {
    passLogHistory.clear();
    var userDetails = await _authService.getUserDetails();
    isLoading.value = true;
    List<PassHistoryModel> passData =
    await _passService.getPassHistoryData(userDetails.id!);
    passData.forEach((element) {
      passLogHistory.add(element);
    });
    getSelectedDateLogHistory();
    isLoading.value = false;
    update();
  }



  selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate.value,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != selectedDate) {
      selectedDate.value = picked;
      getSelectedDateLogHistory();
    }
    update();
  }

  getSelectedDateLogHistory() {
    selectedDateLogHistory.clear();
    passLogHistory.forEach((element) {
      if (element.getDateOnly() ==
          selectedDate.value.toString().split(' ')[0]) {
        selectedDateLogHistory.add(element);
      }
    });
    update();
  }
}
