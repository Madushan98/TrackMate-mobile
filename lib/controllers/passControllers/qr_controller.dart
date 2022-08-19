import 'package:get/get.dart';
import '../../service/Pass/PassService.dart';

class QRController extends GetxController {
  var _passService = Get.find<PassService>();
  var passToken = "".obs;
  var isLoading = false.obs;

  getPassToken(String passId) async {
    isLoading.value = true;
    passToken.value = (await _passService.getPassToken(passId))!;
    isLoading.value = false;
    update();
  }
}
