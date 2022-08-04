import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../service/Authentication/AuthService.dart';
import '../appPages.dart';

class PremiumGuard extends GetMiddleware {

  final authService = Get.find<AuthService>();


  RouteSettings? redirect(String? route)  {

    return authService.isAuthenticated
        ? null
        : const RouteSettings(name: Routes.Login);
  }


}