import 'package:covid_safe_app/controllers/ScannerControllers/scanData_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../controllers/ScannerControllers/scanner_dashboard_controller.dart';
import '../../../models/PassData/PassVerifyModel.dart';
import '../../../widgets/CustomButton.dart';

class ScanDataScreen extends StatefulWidget {
  const ScanDataScreen({Key? key, required this.verifyToken}) : super(key: key);

  final String verifyToken;

  @override
  State<ScanDataScreen> createState() => _ScanDataScreenState();
}

class _ScanDataScreenState extends State<ScanDataScreen> {
  final _scanDataController = Get.put(ScanDataController());

  @override
  void initState() {
    _scanDataController.setData(widget.verifyToken);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Text("Pass Details"),
      ),
      body: Container(
        child: Obx(() {
          return SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  _scanDataController.isLoading.value
                      ? Container(
                          height: _size.height * 0.6,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 20),
                            child: Container(
                              height: _size.height * 0.8,
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
                      : _scanDataController.scanData.value.nationalId ==null
                          ?Container(
                    height: _size.height * 0.8,
                    child: Center(
                      child: Text(
                        "User Verification Failed"
                      ),
                    ),
                  ) : Container(
                              height: _size.height * 0.6,
                              decoration: BoxDecoration(),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "${_scanDataController.scanData.value.passCategory} Pass",
                                          style: TextStyle(
                                            fontSize: 25,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Created Time :",
                                          style: TextStyle(
                                            fontSize: 18,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text(
                                          _scanDataController.scanData.value
                                                  .generatedDateTime ??
                                              "No Information",
                                          style: TextStyle(
                                            fontSize: 18,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "User National ID :",
                                          style: TextStyle(
                                            fontSize: 18,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text(
                                          _scanDataController
                                                  .scanData.value.nationalId ??
                                              "No Information",
                                          style: TextStyle(
                                            fontSize: 18,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Full Name :",
                                          style: TextStyle(
                                            fontSize: 18,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text(
                                          _scanDataController
                                                  .scanData.value.fullName ??
                                              "No Information",
                                          style: TextStyle(
                                            fontSize: 18,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Contact Number :",
                                          style: TextStyle(
                                            fontSize: 18,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text(
                                          _scanDataController.scanData.value
                                                  .primaryContactNumber ??
                                              "No Information",
                                          style: TextStyle(
                                            fontSize: 18,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "From  -  ${_scanDataController.scanData.value.from}",
                                          style: TextStyle(
                                            fontSize: 18,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 80,
                                        ),
                                        Text(
                                          "To -  ${_scanDataController.scanData.value.to}",
                                          style: TextStyle(
                                            fontSize: 18,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ) ,
                  _scanDataController.isVerifying.value ? Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 20),
                          child: Container(
                            height: _size.height * 0.8,
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
                        Container(
                          child: Text(
                            "Accept Pass"
                          ),
                        )
                      ],
                    ),
                  ) : Container(),


                  Container(
                    height: _size.height * 0.1,
                  ),
                  Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Align(
                            alignment: Alignment.center,
                            child: CustomNumphoricWidget(
                              sizeVal: 40,
                              icon: Icons.close,
                              onTap: () {
                         _scanDataController.failedVerification();
                              },
                            ),
                          ),
                        ),
                        Expanded(flex: 1, child: Container()),
                        Expanded(
                          flex: 1,
                          child: Align(
                            alignment: Alignment.center,
                            child: Center(
                              child: CustomNumphoricWidget(
                                sizeVal: 40,
                                icon: Icons.check,
                                onTap: () {
                                  _scanDataController.acceptPass();
                                },
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
          );
        }),
      ),
    );
  }
}
