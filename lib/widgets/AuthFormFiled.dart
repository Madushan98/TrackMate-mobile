import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthFormFieldWidget extends StatelessWidget {
  const AuthFormFieldWidget({
    Key? key,
    required Size size,
    required this.icon,
    this.initValue = "",
     this.textInputType = TextInputType.text,
    required this.hintText, required this.updateValue,
  })  : _size = size,
        super(key: key);

  final Size _size;
  final String initValue;
  final IconData icon;
  final TextInputType textInputType;
  final String hintText;
  final Function updateValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Center(
        child: Container(
          height: 55,
          decoration: BoxDecoration(
            color: Color(0xFFC4C4C4).withOpacity(0.25),
            borderRadius: new BorderRadius.circular(10),
          ),
          child: Container(
            child: Row(
              children: [
                Expanded(
                  flex: 20,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 10),
                    child: TextFormField(
                      keyboardType: textInputType,
                      initialValue: initValue,
                      style: TextStyle(),
                      decoration: InputDecoration(
                        fillColor: Colors.grey.withOpacity(0.2),
                        hintText: hintText,
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 0, vertical: 5),
//                          labelText: value.value,
                      ),
                      onChanged: (text) {
                        updateValue(text);
                      },
                    ),
                  ),
                ),
                Expanded(
                    flex: 4,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Icon(
                          icon,
                          color: Colors.grey,
                          size: 16,
                        ),
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
