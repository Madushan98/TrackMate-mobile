
import 'package:covid_safe_app/routes/appPages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class DashBord extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Container(
        child:  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: GestureDetector(
            onTap: () {

            },
            child: Material(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
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
      ),
    );
  }
}
