import 'package:covid_safe_app/controllers/screenControllers/dashBoardController.dart';
import 'package:covid_safe_app/screens/Scanner/Pages/passLog_screen.dart';
import 'package:covid_safe_app/screens/home/Pages/account_screen.dart';
import 'package:covid_safe_app/screens/home/Pages/dashBord_screen.dart';
import 'package:covid_safe_app/screens/home/Pages/location_screen.dart';
import 'package:covid_safe_app/screens/home/Pages/pass_screen.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controllers/accountController/account_controller.dart';
import 'Pages/notification_screen.dart';
import 'Pages/passLog_user_screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  var selectedIndex = 0;
  final _accountController = Get.put(AccountController());
  final DashBoardController dashBoardController =
      Get.put(DashBoardController());

  onItemTap(int value) async {
    setState(() {
      selectedIndex = value;
    });
  }

  static List<Widget> _pages = <Widget>[
    DashBord(),
    LocationScreen(),
    // NotificationScreen(),
    PassScreen(),
    PassLogUserScreen(),
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
                    Icons.location_on_rounded,
                    size: 25,
                  ),
                  label: 'Map',
                ),
                // BottomNavigationBarItem(
                //   icon: Icon(
                //     Icons.notifications_rounded,
                //     size: 25,
                //   ),
                //   label: "Alert",
                // ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.qr_code_2_rounded,
                    size: 25,
                  ),
                  label: 'Pass',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.history,
                    size: 25,
                  ),
                  label: 'Logs',
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
               if(value == 0) {
                 _accountController.loadData();
               }
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
