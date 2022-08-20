import 'package:covid_safe_app/models/User/UserModel.dart';
import 'package:get/get.dart';

import '../../routes/appPages.dart';
import '../../service/Authentication/AuthService.dart';

class AccountController extends GetxController {
  var natId = "".obs;
  var userName = "".obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    loadData();
    super.onInit();
  }

  var _authService = Get.find<AuthService>();

  loadData() async {
    isLoading.value = true;
    User user = await _authService.getUserDetails();
    userName.value = user.fullName!;
    natId.value = user.nationalId!;
    isLoading.value = false;
    update();
  }

  goToUserDetails() {
    Get.toNamed(Routes.User);
  }

  Future<void> logOut() async {
    _authService.LogOut();
    Get.offAllNamed(Routes.Login);
  }
}
