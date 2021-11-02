import 'package:covid_safe_app/screens/loginScreen.dart';
import 'package:covid_safe_app/screens/signUpScreen.dart';
import 'package:covid_safe_app/screens/welcomeScreen.dart';
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

    ),
  ];
}
