import 'package:covid_safe_app/controllers/ScannerControllers/scanner_dashboard_controller.dart';
import 'package:covid_safe_app/screens/CovidData/covid_data_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../configuration/styles/colors.dart';
import '../../../routes/appPages.dart';
import '../../../widgets/counter.dart';
import '../../../widgets/profileAvatar.dart';

class ScannerDashBord extends StatefulWidget {
  const ScannerDashBord({Key? key}) : super(key: key);

  @override
  State<ScannerDashBord> createState() => _ScannerDashBordState();
}

class _ScannerDashBordState extends State<ScannerDashBord> {
  String imageUrl =
      'https://img.freepik.com/free-photo/handsome-young-businessman-shirt-eyeglasses_85574-6228.jpg?size=626&ext=jpg';

  final _scannerDashboardController = Get.put(ScannerDashBoardController());

  @override
  void initState() {
    _scannerDashboardController.setUserName();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 20.0),
        child: Container(
          width: 60,
          height: 60,
          child: FloatingActionButton(
            backgroundColor: Colors.grey[900],
            child: Icon(
              Icons.qr_code_scanner,
              size: 30,
              color: Colors.yellow[800],
            ),
            onPressed: () async {
              var data = await FlutterBarcodeScanner.scanBarcode(
                  "red", "Cancel", true, ScanMode.QR);
              if(data == "-1"){
                Get.toNamed(Routes.Scanner);
              }else if (data.isNotEmpty) {
                _scannerDashboardController.getScanData(data);
              }
            },
          ),
        ),
      ),
      body: SingleChildScrollView(child: Container(
        child: Obx(() {
          return Column(
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
                    padding: const EdgeInsets.only(top: 10.0, bottom: 20),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 10,
                                child: Text(
                                  _scannerDashboardController.userName.value,
                                  style: TextStyle(
                                      fontSize: _size.height * 0.02,
                                      color: Colors.white),
                                ),
                              ),
                              Expanded(
                                  flex: 2,
                                  child: ProfileAvatar(
                                    imageUrl: imageUrl,
                                    size: 20,
                                  )),
                            ],
                          ),
                        ),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Covid-19 Scanner",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: _size.height * 0.03),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              CovidDataScreen(),
            ],
          );
        }),
      )),
    );
  }
}
