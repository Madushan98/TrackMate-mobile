import 'package:covid_safe_app/configuration/base_client.dart';
import 'package:covid_safe_app/controllers/baseController.dart';
import 'package:get/get.dart';

class DashBoardController extends GetxController with BaseController {
  void getCovidCurrentData() async {
    showLoading('Fetching data');
    var response = await BaseClient()
        .get("https://www.hpb.health.gov.lk/api/get-current-statistical", '')
        .catchError(handleError);

    if (response == null) return;
    hideLoading();
    print(response);
  }

  @override
  void onInit() {
    print("hello");
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    Get.delete();
    print("[ DashBordController ] => onClose()");
    super.onClose();
  }
}
