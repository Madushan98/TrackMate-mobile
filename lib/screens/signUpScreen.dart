import 'package:covid_safe_app/controllers/userController.dart';
import 'package:covid_safe_app/routes/appPages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';



class SignUpScreen extends StatelessWidget {


  final formKey = GlobalKey<FormState>(); //key for form
  String name="";
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return  Scaffold(
        key: _scaffoldKey,

        backgroundColor: Color(0xFFffffff),
        body: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Container(
            padding: const EdgeInsets.only(left: 40, right: 40),
            child: Form(
              key: formKey, //key for form
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height:size.height*0.1),
                  Text("Register Your Details!", style: TextStyle(fontSize: 30, color:Colors.black),),

                  SizedBox(height: size.height*0.05,),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Enter your full name"
                    ),
                    validator: (value){
                      if(value!.isEmpty || !RegExp(r'^[a-z A-Z]+$').hasMatch(value)){
                        return "Enter your name correctly" ;

                      }else{
                        return null ;
                      }
                    },
                  ),
                  SizedBox(height: size.height*0.025,),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: "Enter your number (ex-+94 xxx xxx xxx)"
                    ),
                    validator: (value){
                      if(value!.isEmpty || !RegExp(r'^[+94]*[]+$').hasMatch(value)){
                        return "Invalid mobile number" ;

                      }else{
                        return null ;
                      }
                    },
                  ),

                  SizedBox(height: size.height*0.025,),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: "Enter your E-mail "
                    ),
                    validator: (value){
                      if(value!.isEmpty || !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)){
                        return "Invalid E-mail address" ;

                      }else{
                        return null ;
                      }
                    },
                  ),

                  SizedBox(height: size.height*0.1,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Confirm Details", style: TextStyle(fontSize: 22, color:Colors.black),
                      ),

                      NeumorphicButton(

                        margin: EdgeInsets.only(top: 12),
                        onPressed: (){
                          if(formKey.currentState!.validate()){
                            final snackBar = SnackBar(content: Text("submiting Details"));
                            _scaffoldKey.currentState!.showSnackBar(snackBar);
                          }
                          Get.toNamed(Routes.HOME);
                        },

                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                          size: 30,
                        ),

                        style: NeumorphicStyle(
                          color: Colors.redAccent,
                          shape: NeumorphicShape.flat,
                          boxShape:
                            NeumorphicBoxShape.circle(),

                        ),
                      )

                    ],
                  )
                ],
              ),
            ),
          ),
        )
    );
  }


}