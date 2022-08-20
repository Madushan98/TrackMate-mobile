import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class CustomNumphoricWidget extends StatelessWidget {
  const CustomNumphoricWidget({
    Key? key,
    required this.onTap,
    this.icon = Icons.arrow_forward,
  }) : super(key: key);

  final Function onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        child: Row(
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.bottomRight,
                child: NeumorphicButton(
                  margin: EdgeInsets.only(top: 12),
                  onPressed: () {
                    onTap();
                  },
                  child: Icon(
                    icon,
                    color: Colors.white,
                    size: 30,
                  ),
                  style: NeumorphicStyle(
                    color: Colors.black,
                    shape: NeumorphicShape.flat,
                    boxShape: NeumorphicBoxShape.circle(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButtonWidget2 extends StatelessWidget {
  const CustomButtonWidget2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        height: 40,
        width: 80,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 7,
              child: Center(
                child: Text(
                  "REGISTER",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
            color: Color(0xFF252525), borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
