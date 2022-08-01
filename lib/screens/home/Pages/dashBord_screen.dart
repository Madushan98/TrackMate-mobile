import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../widgets/profileAvatar.dart';

class DashBord extends StatefulWidget {
  const DashBord({Key? key}) : super(key: key);

  @override
  State<DashBord> createState() => _DashBordState();
}

class _DashBordState extends State<DashBord> {


  String imageUrl =
      'https://img.freepik.com/free-photo/handsome-young-businessman-shirt-eyeglasses_85574-6228.jpg?size=626&ext=jpg';


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: Container(
      child: Column(
        children: [
          Container(
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "MAdushan Ranasinghe"
                  ),
                ),
                Container(
                  child: ProfileAvatar(imageUrl: imageUrl,size: 20,),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
