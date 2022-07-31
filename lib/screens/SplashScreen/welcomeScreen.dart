import 'package:covid_safe_app/customPainter/curves.dart';
import 'package:covid_safe_app/routes/appPages.dart';
import 'package:covid_safe_app/screens/SplashScreen/splash_image_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;

    return Material(
      color: Colors.white,
      child: SafeArea(
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Container(
            height: _size.height * 0.9,
            child: Column(
              children: [
                SizedBox(
                  height: _size.height * 0.1,
                ),
                Expanded(
                  flex: 12,
                  child: WelcomeImage(),
                ),
                Expanded(
                    flex: 4,
                    child: Container(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 20),
                          child: Text("Covid-Authenticator",
                              style: TextStyle(
                                  color: Colors.grey[700],
                                  fontWeight: FontWeight.w400,
                                  fontSize: 40)),
                        ),
                      ),
                    )),
                Expanded(
                  flex: 4,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 14,
                          child: SizedBox(
                            width: 50,
                          ),
                        ),
                        Expanded(
                          flex: 10,
                          child: NeumorphicButton(
                            margin: EdgeInsets.only(top: 12),
                            onPressed: () {
                              Get.toNamed(Routes.Login);
                            },
                            child: Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                              size: 40,
                            ),
                            style: NeumorphicStyle(
                              color: Colors.black,
                              shape: NeumorphicShape.flat,
                              boxShape: NeumorphicBoxShape.circle(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
