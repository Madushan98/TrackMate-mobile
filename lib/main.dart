import 'package:covid_safe_app/routes/appPages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'main_binding.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Covid Safe App',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.cupertino,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      initialBinding: MainBinding(),
    );
  }
}

