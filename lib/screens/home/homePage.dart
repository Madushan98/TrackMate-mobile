import 'package:covid_safe_app/controllers/screenControllers/dashBoardController.dart';
import 'package:covid_safe_app/screens/home/Pages/account_screen.dart';
import 'package:covid_safe_app/screens/home/Pages/dashBord.dart';
import 'package:covid_safe_app/widgets/profileAvatar.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  var selectedIndex = 1;

  final DashBoardController dashBoardController =
      Get.put(DashBoardController());

  onItemTap(int value) async {
    setState(() {
      selectedIndex = value;
    });
  }

  static List<Widget> _pages = <Widget>[
    DashBord(),
    DashBord(),
    DashBord(),
    AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Container(
          child: BottomNavigationBar(
            backgroundColor: Colors.white,
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
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.notifications_rounded,
                  size: 25,
                ),
                label: "Alert",
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
                IconThemeData(color: Colors.yellow[900], size: 25),
            selectedItemColor: Colors.yellow[900],
            selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
            currentIndex: selectedIndex,
            elevation: 10,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            onTap: (value) {
              onItemTap(value);
            },
          ),
        ),
        body:  _pages.elementAt(selectedIndex),
      ),
    );
  }
}
