import 'package:covid_safe_app/customPainter/curves.dart';
import 'package:covid_safe_app/routes/appPages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Material(
      color: Colors.white,
      child: SafeArea(
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Container(
            decoration: BoxDecoration(color: Colors.white60),
            child: Stack(
              children: [
                CustomPaint(
                  size: Size(
                      size.width,
                      (size.width * 0.9468599033816425)
                          .toDouble()),
                  painter: RPSCustomPainter(),
                ),
                Container(
                  child: Column(
                    children: [

                      Container(
                        height: size.height * 0.5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 15
                        ),
                        child: Container(
                            width: size.width,
                            height: size.height*0.25,
                            child:Text(
                              'Get Control in your life \nuse Covid safe \napp'
                              ,
                              style: GoogleFonts.manrope(
                                textStyle: TextStyle(color: Colors.black,height: 1.4, letterSpacing: .7, fontSize: 25,fontWeight:FontWeight.w700 ),
                              ),
                            )
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.Login);
                          },


                          child: Material(
                            elevation: 1,

                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black,

                            child: Container(
                              height: 60,
                              child: Center(
                                child: Text(
                                  'Login',
                                  style: GoogleFonts.manrope(
                                    textStyle: TextStyle(
                                        color: Colors.white,
                                        letterSpacing: .5,
                                        fontSize: 20,fontWeight:FontWeight.w700 ),
                                  ),
                                ),
                              ),

                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: size.height * 0.025,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.SignUp);
                          },
                          child: Material(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black,
                            elevation: 1,
                            child: Container(
                              height: 60,
                              child: Center(
                                child: Text(
                                  'Sign Up',
                                  style: GoogleFonts.manrope(
                                    textStyle: TextStyle(
                                        color: Colors.white,
                                        letterSpacing: .5,
                                        fontSize: 20,fontWeight:FontWeight.w700 ),
                                  ),
                                ),
                              ),

                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
