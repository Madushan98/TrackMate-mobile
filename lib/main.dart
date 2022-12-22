import 'package:covid_safe_app/configuration/app_config.dart';
import 'package:covid_safe_app/routes/appPages.dart';
import 'package:covid_safe_app/service/Authentication/AuthService.dart';
import 'package:covid_safe_app/service/Authentication/RoleService.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'main_binding.dart';


void main() {
  setEnvironment(Environment.dev);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
      statusBarColor: Colors.white,
      systemNavigationBarDividerColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    Get.put(AuthService());
    Get.put<RoleService>(RoleService());
    return GetMaterialApp(
      title: 'Covid Safe App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialBinding: MainBinding(),
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.cupertino,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,

    );
  }
}

