import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:toggle_switch/toggle_switch.dart';

class AuthToggleButtonWidget extends StatefulWidget {
  const AuthToggleButtonWidget({
    Key? key,
    required Size size,
    required this.updateValue,
    required this.data,
  })  : _size = size,
        super(key: key);

  final Size _size;
  final List<String> data;
  final Function updateValue;

  @override
  State<AuthToggleButtonWidget> createState() => _AuthToggleButtonWidgetState();
}

class _AuthToggleButtonWidgetState extends State<AuthToggleButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10, left: 0, right: 20),
      child: Center(
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: Color(0xFFC4C4C4).withOpacity(0.25),
            borderRadius: new BorderRadius.circular(10),
          ),
          child: Container(

          ),
        ),
      ),
    );
  }
}
