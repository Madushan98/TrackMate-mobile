
import 'package:covid_safe_app/controllers/screenControllers/dashBoardController.dart';
import 'package:covid_safe_app/widgets/profileAvatar.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class DashBord extends StatefulWidget  {



  @override
  _DashBordState createState() => _DashBordState();
}

class _DashBordState extends State<DashBord> with SingleTickerProviderStateMixin {


  final DashBoardController dashBoardController = Get.put(DashBoardController());
  String imageUrl =
      'https://img.freepik.com/free-photo/handsome-young-businessman-shirt-eyeglasses_85574-6228.jpg?size=626&ext=jpg';

  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: Scaffold(



        body: CustomScrollView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
         slivers: [
           SliverAppBar(
             automaticallyImplyLeading: false,


             brightness: Brightness.light,
             backgroundColor: Colors.white,
             title: Text(
               'Covid Safe',
               style: const TextStyle(
                 color: Color(0xFF4BCB1F),
                 fontSize: 18.0,
                 fontWeight: FontWeight.bold,
                 letterSpacing: 1,
               ),
             ),
             centerTitle: false,
             floating: true,
             actions: [
               ProfileAvatar( imageUrl: imageUrl)
             ],



           ),

           SliverToBoxAdapter(
             child: InkWell(
               onTap: (){
                 dashBoardController.getCovidCurrentData();
               },
               child: Container(
                  child: Text("Tap"),
               ),
             ),
           ),

         ],

        ),
      ),
    );
  }
}
