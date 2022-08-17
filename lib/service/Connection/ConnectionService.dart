import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';

enum ConnectivityStatus {
  WiFi,
  Cellular,
  Offline,
}

class ConnectivityService {
  final Connectivity connectivity = Connectivity();
  StreamController<bool> connectionStatusController = StreamController<bool>();

  ConnectivityController() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      connectionStatusController.add(getStatusFromResult(result));
    });
  }

  bool getStatusFromResult(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.mobile:
        return true;
      case ConnectivityResult.wifi:
        return true;
      case ConnectivityResult.none:
        return false;
      default:
        return false;
    }
  }

  Future<bool> checkConnection() async {
    bool isConnected = false;
    ConnectivityResult connectivityResult =
    await connectivity.checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
    //   try {
    //     final result = await InternetAddress.lookup('google.com');
    //     if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
    //       isConnected = true;
    //     }
    //   } on SocketException catch (_) {
    //     isConnected = false;
    //   }
    // } else {
      isConnected = true;
    }
    return isConnected;
  }

  Future<void> checkStreamConnection() async {}
}
