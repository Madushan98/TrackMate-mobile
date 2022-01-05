

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  final String imageUrl;
  final bool isActive;
  final bool hasBorder;

  const ProfileAvatar({
    Key key,
     this.imageUrl,
    this.isActive =true,
    this.hasBorder = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
      child: Stack(
        children: [
          CircleAvatar(
            radius: 15.0,
            backgroundColor: Colors.green,
            child: CircleAvatar(
              radius: hasBorder ? 15.0 : 18.0,
              backgroundColor: Colors.grey[200],
              backgroundImage: NetworkImage(imageUrl),
            ),
          ),
          isActive
              ? Positioned(
            bottom: 5.0,
            right: 0.0,
            child: Container(
              height: 10.0,
              width: 10.0,
              decoration: BoxDecoration(
                color: Color(0xFF4BCB1F),
                shape: BoxShape.circle,
                border: Border.all(
                  width: 2.0,
                  color: Colors.white,
                ),
              ),
            ),
          )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}

