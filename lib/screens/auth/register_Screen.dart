import 'package:covid_safe_app/widgets/AuthFormFiled.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../routes/appPages.dart';
import '../../widgets/CustomButton.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  ScrollController scollBarController = ScrollController();

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Material(
          color: Colors.white,
          child: Container(
            height: _size.height,
            child: Column(
              children: [
                Expanded(
                  flex: 8,
                  child: Center(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Text(
                              "Get Started",
                              style: TextStyle(
                                fontSize: 40,
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              "Created your account",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 20,
                  child: Container(
                    child: CupertinoScrollbar(
                      child: ListView(
                        children: [
                          AuthFormFieldWidget(
                            size: _size,
                            icon: Icons.person,
                            hintText: "ID Number",
                            updateValue: () {},
                          ),
                          AuthFormFieldWidget(
                            size: _size,
                            icon: Icons.drive_file_rename_outline,
                            hintText: "Full Name",
                            textInputType: TextInputType.text,
                            updateValue: () {},
                          ),
                          AuthFormFieldWidget(
                            size: _size,
                            icon: Icons.phone_android,
                            hintText: "Mobile No",
                            textInputType: TextInputType.phone,
                            updateValue: () {},
                          ),
                          AuthFormFieldWidget(
                            size: _size,
                            icon: Icons.calendar_month,
                            hintText: "BirthDay",
                            textInputType: TextInputType.datetime,
                            updateValue: () {},
                          ),
                          AuthFormFieldWidget(
                            size: _size,
                            icon: Icons.remove_red_eye_outlined,
                            hintText: "Password",
                            textInputType: TextInputType.visiblePassword,
                            updateValue: () {},
                          ),
                          AuthFormFieldWidget(
                            size: _size,
                            icon: Icons.remove_red_eye_outlined,
                            hintText: "Confirm Password",
                            textInputType: TextInputType.visiblePassword,
                            updateValue: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                CustomNumphoricWidget(
                  onTap: () {},
                ),
                Expanded(
                    flex: 4,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        child: Column(
                          children: [
                            Container(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("New User?",
                                        style: TextStyle(
                                            color: Colors.grey[500],
                                            fontWeight: FontWeight.w400,
                                            fontSize: 20)),
                                    InkWell(
                                      onTap: () {
                                        Get.toNamed(Routes.Login);
                                      },
                                      child: Text(" Log In",
                                          style: TextStyle(
                                              color: Colors.yellow[900],
                                              fontWeight: FontWeight.w600,
                                              fontSize: 20)),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ))
              ],
            ),
          )),
    );
  }
}
