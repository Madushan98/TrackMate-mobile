import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:url_launcher/url_launcher.dart';

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
  AESEncryption encryption = new AESEncryption();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Center(child: Text("Pass Logs")),
      ),
      body: Container(
        child: ListView.builder(
    itemCount: _passController.passList.length,
    itemBuilder: (BuildContext context, int index) {
    var pass = _passController.passList[index];
    return InkWell(
    onTap: () {
    Get.toNamed(Routes.QrCodeScreen,
    arguments: QrCodeScreen(
    passId: pass.id!,
    ));
    },,

      ),
    );
  }
}
