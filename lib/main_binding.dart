import 'package:covid_safe_app/service/Authentication/AuthService.dart';
import 'package:covid_safe_app/service/Authentication/RoleService.dart';
import 'package:covid_safe_app/service/Connection/ConnectionService.dart';
import 'package:covid_safe_app/service/CovidData/CovidDataService.dart';
import 'package:covid_safe_app/service/Location/LocationService.dart';
import 'package:covid_safe_app/service/Pass/PassService.dart';
import 'package:covid_safe_app/service/Scanner/ScannerService.dart';
import 'package:get/get.dart';


class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthService());
    Get.put<RoleService>(RoleService());
    Get.put<ConnectivityService>(ConnectivityService());
    Get.put(PassService());
    Get.put(ScannerService());
    Get.put(CovidDataService());
    Get.put(LocationService());
  }
}
