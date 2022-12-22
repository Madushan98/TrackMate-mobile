import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../configuration/app_constants.dart';
import '../../controllers/accountController/account_controller.dart';
import '../../widgets/SetDetailsWidgets/set_details_widgets.dart';
import '../account/Organization/organization_update_screen.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {

  var _accountController = Get.put(AccountController());

  @override
  Widget build(BuildContext context) {
    return  Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: Obx(() {

              if(_accountController.isVerified.value == VerificationStatus.notVerified) {
                return Container(
                  height: 80,
                  child: OrganizationDetailsSetWidget(),
                );
              }else if(_accountController.isVerified.value == VerificationStatus.pending) {
                return Container(
                  height: 80,
                  child: VerificationStatusPendingWidget(),
                );
              }
              else {
                return Container();
              }
              return Container(
                color: Colors.white,
                child: Center(
                  child: Container(
                    // Set Organization  Details Widget
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Container(
                          height: 40,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 6,
                                child: Text(
                                  "Account Is Not Activated  ",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: InkWell(
                                  onTap: () {
                                    Get.to(() => OrganizationDetailsUpdateScreen());
                                  },
                                  child: Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.black,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Center(
                                        child: Text(
                                          "Activate",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(flex: 1, child: Container())
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      );

  }
}