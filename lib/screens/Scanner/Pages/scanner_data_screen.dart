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
    _scanDataController.getVerificationData(widget.verifyToken);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Text("Pass Details"),
      ),
      body: Container(
        child: Obx(() {
          return Column(
            children: [
              Container(
                decoration: BoxDecoration(

                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Text("User ID",
                          style: TextStyle(

                          ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text("982351123V")
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Text("User ID"),
                          SizedBox(
                            width: 20,
                          ),
                          Text("982351123V")
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Text("User ID"),
                          SizedBox(
                            width: 20,
                          ),
                          Text("982351123V")
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Text(_scanDataController.scanData.value),

              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomNumphoricWidget(
                      icon: Icons.close,
                      onTap: () {
                        //  _authController.getUser();

                      },
                    ),
                    CustomNumphoricWidget(
                      icon: Icons.check,
                      onTap: () {
                        //  _authController.getUser();

                      },
                    ),
                  ],
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}
