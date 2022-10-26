import 'package:get/get.dart';
import '../../models/PassData/PassHistoryModel.dart';
import '../../service/Authentication/AuthService.dart';
import '../../service/Location/LocationService.dart';

class LocationController extends GetxController {
  var isLoading = false.obs;
  var _locationService = Get.find<LocationService>();
  var passLogHistory = RxList<PassHistoryModel>();
  var _authService = Get.find<AuthService>();

  @override
  void onInit() {
    getScanHistoryByDate(  DateTime.now());
    super.onInit();
  }


  getScanHistoryByDate(DateTime dateTime) async {
    String date = dateTime.toString().split(" ").first;
    passLogHistory.clear();
    var userDetails = await _authService.getUserDetails();
    isLoading.value = true;
    List<PassHistoryModel> passData =
    await _locationService.getPassHistoryData(userDetails.id!,date);
    passData.forEach((element) {
      passLogHistory.add(element);
    });
    isLoading.value = false;
    update();
  }




}