import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../configuration/app_constants.dart';
import '../../../controllers/LocationController/location_controller.dart';
import '../../../controllers/accountController/account_controller.dart';
import '../../../widgets/SetDetailsWidgets/set_details_widgets.dart';
import '../../../widgets/profileAvatar.dart';
import '../../CovidData/covid_data_screen.dart';

class DashBord extends StatefulWidget {
  const DashBord({Key? key}) : super(key: key);

  @override
  State<DashBord> createState() => _DashBordState();
}

class _DashBordState extends State<DashBord> {
  final _accountController = Get.put(AccountController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Obx(() {
      return Scaffold(
        body: _accountController.isLoading.value
            ? Container(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: Container(
                    height: _size.height * 0.8,
                    width: _size.height,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(
                          color: Colors.grey[900],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            : Container(
                child: Column(
                  children: [
                    Expanded(
                      flex: 10,
                      child: SingleChildScrollView(
                          child: Container(
                        child: Column(
                          children: [
                            Material(
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(25),
                                      bottomRight: Radius.circular(25))),
                              color: Colors.grey[900],
                              child: Container(
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10.0, bottom: 20),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              flex: 10,
                                              child: Text(
                                                _accountController
                                                        .userName.value +
                                                    " -   " +
                                                    _accountController
                                                        .natId.value,
                                                style: TextStyle(
                                                    fontSize:
                                                        _size.height * 0.02,
                                                    color: Colors.white),
                                              ),
                                            ),
                                            Expanded(
                                                flex: 2,
                                                child: ProfileAvatar(
                                                  imageUrl: Constants.imageUrl,
                                                  size: 20,
                                                )),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 20.0),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Covid-19",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize:
                                                        _size.height * 0.03),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      _accountController.isVaccinated.value
                                          ? VaccinationDetailsShowWidget(
                                              vaccinationDetails:
                                                  _accountController
                                                      .vaccinationDetails.value,
                                            )
                                          : VaccinationDetailsSetWidget(),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            // Covid Data  Screen  with data from health.gov API
                            CovidDataScreen(),
                          ],
                        ),
                      )),
                    ),
                    getVerificationStatus(_accountController.isVerified.value)
                  ],
                ),
              ),
      );
    });
  }
}

Widget getVerificationStatus(String status) {
  if (status == VerificationStatus.notVerified) {
    return Expanded(flex: 1, child: OrganizationDetailsSetWidget());
  } else if (status == VerificationStatus.verified) {
    return Expanded(flex: 1, child: Container());
  } else if (status == VerificationStatus.pending) {
    return Expanded(flex: 1, child: VerificationStatusPendingWidget());
  } else {
    return Container();
  }
}
