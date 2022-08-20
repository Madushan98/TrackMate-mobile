import 'package:get/get.dart';
import '../baseController.dart';

class ScanDataController extends GetxController with BaseController {
  var scanData = "".obs;

  getVerificationData(String data) async {
    scanData.value = data;
  }



}
