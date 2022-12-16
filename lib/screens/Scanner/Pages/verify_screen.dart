import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../controllers/ScannerControllers/scanData_controller.dart';


class VerifyingScreen extends StatelessWidget {
  const VerifyingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _scanDataController = Get.put(ScanDataController());
    final _size = MediaQuery
        .of(context)
        .size;
    return Container(
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

          ],
      ),
    );
  }
}
