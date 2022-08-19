import 'package:covid_safe_app/models/PassData/PassModel.dart';
import 'package:covid_safe_app/service/Pass/PassService.dart';
import 'package:get/get.dart';

class PassManagerController extends GetxController {
  var _passService = Get.find<PassService>();
  var passList = <PassModel>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    getAllPasses();
    super.onInit();
  }

  getAllPasses() async {
    isLoading.value = true;
    List<PassModel> passData = await _passService.getAllPasses();
    passData.forEach((element) {
      passList.add(element);
    });
    isLoading.value = false;
    update();
  }
}
