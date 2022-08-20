import 'package:covid_safe_app/screens/home/Pages/account_screen.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controllers/screenControllers/dashBoardController.dart';
import 'Pages/scanner_dashbord_screen.dart';
import 'Pages/passLog_screen.dart';

class ScannerHomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<ScannerHomePage>
    with SingleTickerProviderStateMixin {
  var selectedIndex = 0;

  final DashBoardController dashBoardController =
      Get.put(DashBoardController());

  onItemTap(int value) async {
    setState(() {
      selectedIndex = value;
    });
  }

  static List<Widget> _pages = <Widget>[
    ScannerDashBord(),
    PassLogScreen(),
    AccountScreen()
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.transparent,
        statusBarColor: Colors.grey[900],
        systemNavigationBarDividerColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.dark));

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(color: Colors.black, offset: Offset(0, 4), blurRadius: 4)
          ]),
          child: Material(
            color: Colors.white,
            child: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.dashboard,
                    size: 25,
                  ),
                  label: 'DashBord',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.qr_code_2_rounded,
                    size: 25,
                  ),
                  label: 'PassLog',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person,
                    size: 25,
                  ),
                  label: 'Account',
                ),
              ],
              type: BottomNavigationBarType.shifting,
              unselectedItemColor: Colors.black,
              selectedIconTheme:
                  IconThemeData(color: Colors.yellow[800], size: 25),
              selectedItemColor: Colors.yellow[800],
              selectedLabelStyle: TextStyle(fontWeight: FontWeight.w400),
              currentIndex: selectedIndex,
              backgroundColor: Colors.transparent,
              elevation: 20,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              onTap: (value) {
                onItemTap(value);
              },
            ),
          ),
        ),
        body: _pages.elementAt(selectedIndex),
      ),
    );
  }
}
