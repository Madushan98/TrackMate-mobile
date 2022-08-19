import 'package:covid_safe_app/service/Authentication/RoleService.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/route_middleware.dart';

import '../appPages.dart';

class ScannerGuard extends GetMiddleware {
  final roleService = Get.find<RoleService>();

  // RouteSettings? redirect(String? route) {
  //   String userRole = roleService.UserRole;
  //   if (userRole != "Scanner" || userRole != "Admin") {
  //     return RouteSettings(name: Routes.HOME);
  //   }
  // }
}

class UserGuard extends GetMiddleware {
  final roleService = Get.find<RoleService>();

  RouteSettings? redirect(String? route) {
    String userRole =  roleService.UserRole;

    if (userRole != "User") {
      return RouteSettings(name: Routes.Scanner);
    }
  }
}
