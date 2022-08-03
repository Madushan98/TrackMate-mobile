import 'package:covid_safe_app/screens/home/homePage.dart';
import 'package:covid_safe_app/screens/qrCode/qr_screen.dart';
import 'package:covid_safe_app/screens/signUpScreen.dart';
import 'package:covid_safe_app/screens/SplashScreen/welcome_screen.dart';
import 'package:get/get.dart';
import 'dart:core';
import '../screens/auth/login_screen.dart';
import '../screens/auth/register_Screen.dart';
part 'appRoutes.dart';

class AppPages {
  static const INITIAL = Routes.WelCome;

  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
      transitionDuration: Duration(microseconds: 10),
    ),
    GetPage(
      name: Routes.SignUp,
      page: () => RegisterScreen(),
    ),
    GetPage(
      name: Routes.WelCome,
      page: () => WelcomeScreen(),
    ),
    GetPage(
      name: Routes.Login,
      page: () => LoginScreen(),
      transitionDuration: Duration(microseconds: 0),
    ),
    GetPage(
      name: Routes.QrCodeScreen,
      page: () {
        QrCodeScreen _qrCodeScreen = Get.arguments;
        return _qrCodeScreen;
      },
      transitionDuration: Duration(microseconds: 0),
    ),
  ];


}
