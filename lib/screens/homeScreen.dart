import 'package:covid_safe_app/controllers/homeController.dart';
import 'package:covid_safe_app/screens/homePages/dashbord.dart';
import 'package:covid_safe_app/widgets/saloman_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {

  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,



      body: PageView(
        controller: homeController.pageCotroller,
        physics: NeverScrollableScrollPhysics(),
        children: [
          DashBord(),
          DashBord(),
          DashBord(),
          DashBord(),

        ],
      ),
      bottomNavigationBar:

      GetBuilder<HomeController>(

          builder: (_) {
        return SalomonBar(
          elevation: 10,
          currentIndex: _.currentPage,
          onTap: (index) {
            homeController.setPage(index);
            homeController.pageCotroller.animateToPage(
              index,
              duration: homeController.animationDuration,
              curve: Curves.ease,
            );
          },
          items: [
            SalomonBottomBarItem(
              icon: Icon(Icons.home),
              title: Text("Home"),
              selectedColor: Colors.purple,
            ),
            SalomonBottomBarItem(
              icon: Icon(Icons.favorite_border),
              title: Text("Likes"),
              selectedColor: Colors.pink,
            ),
            SalomonBottomBarItem(
              icon: Icon(Icons.search),
              title: Text("Search"),
              selectedColor: Colors.orange,
            ),
            SalomonBottomBarItem(
              icon: Icon(Icons.person),
              title: Text("Profile"),
              selectedColor: Colors.teal,
            ),

          ],
        );

      }),


    );
  }
}





