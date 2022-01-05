import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;


class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.green[800];
    paint.style = PaintingStyle.fill; // Change this to fill

    var path = Path();

    path.moveTo(0, size.height * 0.15);
    path.quadraticBezierTo(
        size.width / 2, size.height / 2, size.width, size.height * 0.15);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}



class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
    paint_0_fill.color = Color(0xffFA4141).withOpacity(1.0);
    canvas.drawCircle(Offset(size.width*0.1799517,size.height*-0.2607914),size.width*0.8466184,paint_0_fill);

    Paint paint_1_fill = Paint()..style=PaintingStyle.fill;
    paint_1_fill.color = Color(0xffFB5656).withOpacity(1.0);
    canvas.drawCircle(Offset(size.width*0.9879227,size.height*-0.4784173),size.width*0.7222222,paint_1_fill);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}