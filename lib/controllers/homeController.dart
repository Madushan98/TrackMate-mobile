import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HomeController extends GetxController {
  final pageCotroller = PageController();
  final animationDuration = const Duration(milliseconds: 350);

  var currentPage = 0 ;

  var hello = 0.obs ;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    pageCotroller.dispose();
    Get.delete();
    print("[ MainController ] => onClose()");
    super.onClose();
  }

  void setPage(int page) {
    currentPage = page ;
    update();
    print(currentPage);


  }
}
