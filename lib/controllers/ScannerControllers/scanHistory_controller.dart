import 'package:covid_safe_app/service/Authentication/AuthService.dart';
import 'package:get/get.dart';
import '../../models/PassData/PassHistoryModel.dart';
import '../../service/Scanner/ScannerService.dart';
import '../baseController.dart';

class ScanHistoryController extends GetxController with BaseController {
  var isLoading = false.obs;
  var passLogHistory = RxList<PassHistoryModel>();
  var _scannerService = Get.find<ScannerService>();
  var _authService = Get.find<AuthService>();

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
        await _scannerService.getPassHistoryData(userDetails.id!);
    passData.forEach((element) {
      passLogHistory.add(element);
    });
    isLoading.value = false;
    update();
  }
}
