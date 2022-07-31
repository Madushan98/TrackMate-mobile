import 'package:covid_safe_app/screens/home/homePage.dart';
import 'package:covid_safe_app/screens/signUpScreen.dart';
import 'package:covid_safe_app/screens/SplashScreen/welcome_screen.dart';
import 'package:get/get.dart';
import 'dart:core';

import '../screens/AuthScreens/loginScreen.dart';
part 'appRoutes.dart';

class AppPages {
  static const INITIAL = Routes.WelCome;


  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
      transitionDuration: Duration(
          microseconds: 10),
    ),
    GetPage(
      name: Routes.SignUp,
      page: () => SignUpScreen(),
    ),
    GetPage(
      name: Routes.WelCome,
      page: () => WelcomeScreen(),
    ),
    GetPage(
      name: Routes.Login,
      page: () => LoginScreen(),
      transitionDuration: Duration(
          microseconds: 0),
    ),
  ];
}
