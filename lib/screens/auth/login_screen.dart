import 'package:covid_safe_app/controllers/authController/auth_controller.dart';
import 'package:covid_safe_app/widgets/AuthFormFiled.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../routes/appPages.dart';
import '../../widgets/CustomButton.dart';

class LoginScreen extends StatelessWidget {
  final _authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    return Material(
        color: Colors.white,
        child: Obx(() {
          return Container(
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                Container(
                  child: Text(
                    "Welcome Back",
                    style: TextStyle(
                      fontSize: 40,
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    "Sign In To Your Account",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                AuthFormFieldWidget(
                  size: _size,
                  initValue: "982351123V",
                  icon: Icons.person,
                  hintText: "ID Number",
                  updateValue: (value) {
                    _authController.nationalId.value = value;
                    _authController.update();
                  },
                ),
                AuthFormFieldWidget(
                  size: _size,
                  initValue: "a",
                  icon: Icons.remove_red_eye_outlined,
                  hintText: "Password",
                  textInputType: TextInputType.visiblePassword,
                  updateValue: (value) {
                    _authController.password.value = value;
                    _authController.update();
                  },
                ),
                _authController.isLogging.value
                    ? Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30, vertical: 20),
                      child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                        children: [

                          CircularProgressIndicator(
                              color: Colors.grey[900],
                            ),
                        ],
                      ),
                    )
                    : CustomNumphoricWidget(
                        onTap: () {
                          //  _authController.getUser();
                          _authController.loginUser(context);
                        },
                      ),
                SizedBox(
                  height: 150,
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
                                    const EdgeInsets.symmetric(vertical: 40.0),
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
                                        Get.toNamed(Routes.HOME);
                                      },
                                      child: Text(" Register now",
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
          );
        }));
  }
}
