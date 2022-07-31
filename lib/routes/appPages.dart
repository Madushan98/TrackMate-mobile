import 'package:covid_safe_app/screens/AuthScreens/loginScreen.dart';
import 'package:covid_safe_app/screens/signUpScreen.dart';
import 'package:covid_safe_app/screens/SplashScreen/welcomeScreen.dart';
import 'package:get/get.dart';
import 'dart:core';
import 'package:covid_safe_app/screens/homeScreen.dart';
part 'appRoutes.dart';

class AppPages {
  static const INITIAL = Routes.WelCome;


  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => HomeScreen(),
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
