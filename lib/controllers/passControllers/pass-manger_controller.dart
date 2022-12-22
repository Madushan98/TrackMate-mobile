import 'package:covid_safe_app/configuration/app_constants.dart';
import 'package:covid_safe_app/models/PassData/PassModel.dart';
import 'package:covid_safe_app/service/Authentication/AuthService.dart';
import 'package:covid_safe_app/service/Pass/PassService.dart';
import 'package:get/get.dart';

import '../../routes/appPages.dart';

class PassManagerController extends GetxController {
  var _passService = Get.find<PassService>();
  var _authService = Get.find<AuthService>();
  var isLoading = false.obs;
  var acceptedPassList = <PassModel>[].obs;
  var pendingPassList = <PassModel>[].obs;
  var isVerified = "".obs;

  @override
  void onInit() {
    getAllPasses();
    super.onInit();
  }

  getAllPasses() async {
    acceptedPassList.clear();
    pendingPassList.clear();
    isLoading.value = true;
    var userDetails = await _authService.getUserDetails();
    isVerified.value = userDetails.isVertified ?? VerificationStatus.notVerified;
    List<PassModel> passData = await _passService.getAllPasses(userDetails.id!);
    passData.forEach((element) {
      if(element.isApproved ?? false){
        acceptedPassList.add(element);
      }else {
        pendingPassList.add(element);
      }
    });
    isLoading.value = false;
    update();
  }



  goToCreatePass() {
    Get.toNamed(Routes.CreatePass);
  }
}
