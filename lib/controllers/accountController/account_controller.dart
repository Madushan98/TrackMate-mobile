import 'package:covid_safe_app/configuration/app_constants.dart';
import 'package:covid_safe_app/models/User/UserModel.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import '../../routes/appPages.dart';
import '../../service/Authentication/AuthService.dart';

class AccountController extends GetxController {
  var natId = "".obs;
  var userName = "".obs;
  var isLoading = false.obs;
  var isVerified = "".obs;
  final userRxn = Rxn<User>();


  @override
  void onInit() {
    loadData();
    super.onInit();
  }

  var _authService = Get.find<AuthService>();

  loadData() async {
    isLoading.value = true;
    User user = await _authService.reloadUserDetails();
    userRxn.value = user;
    userName.value = user.fullName!;
    natId.value = user.nationalId!;
    isVerified.value = user.isVertified ?? VerificationStatus.notVerified;
    isLoading.value = false;
    update();
  }


  getVaccineData() async {

  }
  goToUserDetails() {
    print("user_page");
    Get.toNamed(Routes.User);
  }





  Future<void> logOut() async {
    _authService.LogOut();
    Get.offAllNamed(Routes.Login);
  }
}
