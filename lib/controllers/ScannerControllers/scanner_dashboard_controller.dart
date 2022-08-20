import 'package:covid_safe_app/screens/Scanner/Pages/scanner_data_screen.dart';
import 'package:get/get.dart';
import '../../models/User/UserModel.dart';
import '../../routes/appPages.dart';
import '../../service/Authentication/AuthService.dart';
import '../baseController.dart';

class ScannerDashBoardController extends GetxController with BaseController {
  var _authService = Get.find<AuthService>();
  var userName = "".obs;

  @override
  void onReady() {
    super.onReady();
  }

  setUserName() async {
    User user = await _authService.getUserDetails();
    userName.value = user.fullName!;
    print(userName);
  }

  getScanData(String token) {
    print(token);
    Get.toNamed(Routes.ScanData,
        arguments: ScanDataScreen(
          verifyToken: token,
        ));
  }
}
