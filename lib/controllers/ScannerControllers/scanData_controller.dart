import 'package:covid_safe_app/models/PassData/PassHistoryModel.dart';
import 'package:covid_safe_app/models/PassData/PassVerifyModel.dart';
import 'package:covid_safe_app/service/Scanner/ScannerService.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import '../../models/PassData/PassLogModel.dart';
import '../../routes/appPages.dart';
import '../../service/Authentication/AuthService.dart';
import '../baseController.dart';

class ScanDataController extends GetxController with BaseController {
  var scanData = PassVerifyModel().obs;
  var isLoading = false.obs;
  var _scannerService = Get.find<ScannerService>();
  var _authService = Get.find<AuthService>();
  var isVerifying = false.obs;
  var passLogHistory = RxList<PassHistoryModel>();

  @override
  void onInit() {
    super.onInit();
  }

  setData(String token) async {
    isLoading.value = true;

    scanData.value = await getVerificationData(token);

    isLoading.value = false;
    update();
  }

  failedVerification() {
    Get.toNamed(Routes.Scanner);
  }

  Future<PassVerifyModel> getVerificationData(String token) async {
    print(token);
    var passVerificationData =
        await _scannerService.getPassVerifiedData(token).catchError((error) {
      isLoading.value = false;
      update();
    });
    return passVerificationData;
  }

  Future<bool> acceptPass() async {
    isVerifying.value = true;
    Position positions = await _scannerService.determinePosition();
    await _authService.getUserDetails();

    var userDetails = await _authService.getUserDetails();

    var passLog = new PassLogModel(
        latitude: positions.latitude,
        longitude: positions.longitude,
        scannerId: userDetails.id,
        passId: scanData.value.id,
        userId: scanData.value.userId);
    try {
      var response = await _scannerService.verifyUserScanning(passLog);
      print(response);
      Get.toNamed(Routes.Scanner);
      isVerifying.value = false;

      return true;
    } catch (e) {
      isVerifying.value = false;
      return false;
    }
  }
}
