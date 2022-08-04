import 'dart:async';

import 'package:covid_safe_app/service/Connection/ConnectionService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../routes/appPages.dart';
import '../../service/Authentication/AuthService.dart';

class Splash extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new SplashState();
}

class SplashState extends State<Splash> {
  bool isConnected = false;
  bool tryAgain = false;
  bool _first = true;
  bool _isLogged = false;

  var _connectivityService = Get.find<ConnectivityService>();
  var _authService = Get.find<AuthService>();

  Future<void> checkFirstSeen() async {
    this.isConnected = await _connectivityService.checkConnection();
    await _authService.isTokenAvailable();
    _isLogged = _authService.isAuthenticated;
    if (this.isConnected) {
      if (_isLogged) {
        Get.offAndToNamed(Routes.HOME);
      } else {
        Get.offAndToNamed(Routes.Login);
      }
    } else {
      checkInternet();
    }
  }

  @override
  void initState() {
    super.initState();
    new Timer(new Duration(milliseconds: 2000), () {
      checkFirstSeen();
    });
  }

  @override
  Widget build(BuildContext context) {
    // this.isConnected = Provider.of<bool>(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.98),
      body: Container(
        padding: EdgeInsets.fromLTRB(size.width * 0.1, size.height * 0.2,
            size.width * 0.1, size.height * 0.3),
        decoration: BoxDecoration(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(),
            SizedBox(
              height: size.height * 0.03,
            ),
            Container(
              height: 80,
              width: 80,
              child: Image.asset('assets/images/welcome/corona_splash.png',
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
          ],
        ),
      ),
    );
  }

  void checkInternet() async {
    this.isConnected = await _connectivityService.checkConnection();
    if (!this.isConnected && _first) {
      _first = false;
    }
    if (isConnected) {
      Get.offAndToNamed(Routes.Login);
    }

    void showAlert(BuildContext context, size) {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            "Connection Failed !",
            textAlign: TextAlign.center,
          ),
          content: Container(
            height: size.height * 0.1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Please check your internet connection !",
                  textAlign: TextAlign.center,
                ),
                RaisedButton(
                    child: Text("Try Again !"),
                    onPressed: () {
                      checkInternet();
                    })
              ],
            ),
          ),
        ),
      );
    }
  }
}
