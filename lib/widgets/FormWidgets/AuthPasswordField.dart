import 'dart:ui';

import 'package:covid_safe_app/widgets/FormWidgets/AuthFormFiled.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/icon_data.dart';

class AuthPasswordFieldWidget extends StatefulWidget {
  AuthPasswordFieldWidget({
    Key? key,
    required Size size,
    required this.icon,
    this.initValue = "",
    this.textInputType = TextInputType.text,
    required this.hintText,
    required this.updateValue,
    this.padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    this.setObscureText = false,
    this.customValidator,
  })  : _size = size,
        super(key: key);

  final Size _size;
  final String initValue;
  final EdgeInsetsGeometry padding;
  bool setObscureText;
  final IconData icon;
  final TextInputType textInputType;
  final String hintText;
  final Function updateValue;
  final String? Function(String?)? customValidator;

  @override
  State<AuthPasswordFieldWidget> createState() => _AuthPasswordFieldWidgetState();
}

class _AuthPasswordFieldWidgetState extends State<AuthPasswordFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: Center(
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            color: Color(0xFFC4C4C4).withOpacity(0.25),
            borderRadius: new BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Container(
              child: Row(
                children: [
                  Expanded(
                    flex: 20,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5.0, vertical: 10),
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: widget.customValidator ??
                                (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter details';
                              }
                              return null;
                            },
                        obscureText: widget.setObscureText,
                        keyboardType: widget.textInputType,
                        initialValue: widget.initValue,
                        style: TextStyle(),
                        decoration: InputDecoration(
                          contentPadding:
                          const EdgeInsets.only(bottom: 0.0, top: 0.0),
                          errorStyle: TextStyle(
                            fontSize: 10.0,
                          ),
                          fillColor: Colors.grey.withOpacity(0.2),
                          hintText: widget.hintText,
                          border: InputBorder.none,
                          isDense: true,
                        ),
                        onChanged: (text) {
                          widget.updateValue(text);
                        },
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 5,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              widget.setObscureText = !widget.setObscureText;
                            });
                          },
                          child: Icon(
                            widget.icon,
                            color: Colors.grey,
                            size: 16,
                          ),
                        ),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

