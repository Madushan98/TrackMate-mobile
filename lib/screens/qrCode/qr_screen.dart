import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCodeScreen extends StatefulWidget {
  const QrCodeScreen({Key? key, required this.id}) : super(key: key);

  final String id;

  @override
  State<QrCodeScreen> createState() => _QrCodeScreenState();
}

class _QrCodeScreenState extends State<QrCodeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Text("Generated QR "),
      ),
      body: Center(
        child: QrImage(
          data: "Madushan Ranasinge",
          version: QrVersions.auto,
          size: 250.0,
          gapless: false,
        ),
      ),
    );
  }
}
