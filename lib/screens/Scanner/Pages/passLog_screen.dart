import 'package:covid_safe_app/controllers/ScannerControllers/scanHistory_controller.dart';
import 'package:covid_safe_app/widgets/PassLogWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../controllers/ScannerControllers/scanData_controller.dart';
import '../../../routes/appPages.dart';
import '../../../service/QrGeneration/ASEncryption.dart';

class PassLogScreen extends StatefulWidget {
  PassLogScreen({Key? key}) : super(key: key);

  @override
  _PassLogScreenState createState() => _PassLogScreenState();
}

String qrData = "No data found!";
var data;
bool hasdata = false;

class _PassLogScreenState extends State<PassLogScreen> {
  final _scanHistoryController = Get.put(ScanHistoryController());

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[900],
          title: Center(child: Text("Pass Logs")),
          automaticallyImplyLeading: false,
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            _scanHistoryController.getScanHistoryData();
          },
          child: Container(
            child: Obx(() {
              return _scanHistoryController.isLoading.value
                  ? Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 20),
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
                      child: ListView.builder(
                          itemCount:
                              _scanHistoryController.passLogHistory.length,
                          itemBuilder: (BuildContext context, int index) {
                            var passLogHistory =
                                _scanHistoryController.passLogHistory[index];
                            return PasslogWidget(passLogModel: passLogHistory);
                          }));
            }),
          ),
        ));
  }
}
