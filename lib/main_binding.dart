import 'package:covid_safe_app/service/Authentication/AuthService.dart';
import 'package:covid_safe_app/service/Connection/ConnectionService.dart';
import 'package:get/get.dart';


class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthService>(AuthService());
    Get.put<ConnectivityService>(ConnectivityService());
  }
}
