import 'package:covid_safe_app/models/PassData/PassModel.dart';
import 'package:covid_safe_app/service/Authentication/AuthService.dart';
import 'package:covid_safe_app/service/Pass/PassService.dart';
import 'package:get/get.dart';

import '../../routes/appPages.dart';

class PassManagerController extends GetxController {
  var _passService = Get.find<PassService>();
  var _authService = Get.find<AuthService>();
  var passList = <PassModel>[].obs;
  var isLoading = false.obs;
  var acceptedPassList = <PassModel>[].obs;
  var pendingPassList = <PassModel>[].obs;

  @override
  void onInit() {
    getAllPasses();
    super.onInit();
  }

  getAllPasses() async {
    passList.clear();
    isLoading.value = true;
   var userDetails =  await _authService.getUserDetails();
    List<PassModel> passData = await _passService.getAllPasses(userDetails.id!);
    passData.forEach((element) {
      passList.add(element);
    });
    isLoading.value = false;
    update();
  }

  goToCreatePass() {
    Get.toNamed(Routes.CreatePass);
  }
}
