import 'package:covid_safe_app/configuration/base_client.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class DashBoardController extends GetxController {



  void getCovidCurrentData() async {
    var response = await BaseClient().get("https://www.hpb.health.gov.lk/api/get-current-statistical", '') ;


    if (response == null) return ;

    print(response);


  }





  @override
  void onInit() {
    getCovidCurrentData();
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
