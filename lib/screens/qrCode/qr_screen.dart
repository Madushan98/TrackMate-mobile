import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../controllers/passControllers/qr_controller.dart';

class QrCodeScreen extends StatefulWidget {
  const QrCodeScreen({Key? key, required this.passId}) : super(key: key);

  final String passId;

  @override
  State<QrCodeScreen> createState() => _QrCodeScreenState();
}

class _QrCodeScreenState extends State<QrCodeScreen> {
  final _qrController = Get.put(QRController());

  @override
  void initState() {
    print(widget.passId);
    _qrController.getPassToken(widget.passId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Text("Generated QR "),
      ),
      body: Obx(() {
        return Center(
          child: _qrController.isLoading.value
              ? Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 20),
                    child: Container(
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
              : QrImage(
                  data: _qrController.passToken.value,
                  version: QrVersions.auto,
                  size: 250.0,
                  gapless: false,
                ),
        );
      }),
    );
  }
}
