import 'package:covid_safe_app/service/Pass/PassService.dart';
import 'package:get/get.dart';

import '../../models/PassData/PassHistoryModel.dart';
import '../../service/Authentication/AuthService.dart';
import '../baseController.dart';

class UserPassHistoryController extends GetxController with BaseController {
  var isLoading = false.obs;
  var passLogHistory = RxList<PassHistoryModel>();
  var _passService = Get.find<PassService>();
  var _authService = Get.find<AuthService>();

  @override
  void onInit() {
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
    isLoading.value = false;
    update();
  }
}
