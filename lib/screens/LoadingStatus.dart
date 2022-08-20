import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingStatus {
  static void showErroDialog(
      {String title = 'Error',
      String description = 'Something went wrong',
      required BuildContext context}) {
    final snackBar = SnackBar(
      content: Text(
        description,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.black,
      behavior: SnackBarBehavior.floating,
      action: SnackBarAction(
        label: 'Dismiss',
        disabledTextColor: Colors.white,
        textColor: Colors.yellow,
        onPressed: () {},
      ),
      margin: EdgeInsets.symmetric(vertical: 30, horizontal: 15),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static void showLoading(String message) {
    Get.dialog(
      Dialog(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 8),
              Text(message),
            ],
          ),
        ),
      ),
    );
  }

  static void hideLoading() {
    if (Get.isDialogOpen!) Get.back();
  }
}
