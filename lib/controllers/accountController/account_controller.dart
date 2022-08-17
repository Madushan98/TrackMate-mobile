import 'package:get/get.dart';

import '../../routes/appPages.dart';
import '../../service/Authentication/AuthService.dart';

class AccountController extends GetxController {
  var _authService = Get.find<AuthService>();

  Future<void> logOut() async {
    _authService.LogOut();
    Get.offAllNamed(Routes.Login);
  }
}
