import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class AuthNumberPickerWidget extends StatefulWidget {
  const AuthNumberPickerWidget({
    Key? key,
    required Size size,
    required this.icon,
    this.initValue = "",
    required this.dropDownList,
    required this.onChangedFunction,
    required this.topic,
  })  : _size = size,
        super(key: key);

  final Size _size;
  final String initValue;
  final IconData icon;
  final RxList<Object> dropDownList;
  final Function onChangedFunction;

  final String topic;

  @override
  State<AuthNumberPickerWidget> createState() => _AuthNumberPickerWidgetState();
}

class _AuthNumberPickerWidgetState extends State<AuthNumberPickerWidget> {

  var selectedValue ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10, ),
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
                          horizontal: 10.0, vertical: 10),
                      child: DropdownButton<Object>(
                          hint: Text(widget.topic),
                          value: selectedValue,
                          onChanged: (newValue) {
                            widget.onChangedFunction(newValue);
                            setState(() {
                              selectedValue = newValue;
                            });
                            print(selectedValue);
                          },
                          elevation: 10,
                          items: widget.dropDownList
                              .map<DropdownMenuItem<Object>>((Object value) {
                            return DropdownMenuItem<Object>(
                              value: value,
                              child: Text(
                                value.toString(),
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black,
                                ),
                              ),
                            );
                          }).toList())),
                ),
                Expanded(
                    flex: 8,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Icon(
                          widget.icon,
                          color: Colors.grey,
                          size: 16,
                        ),
                      ),
                    )),
                Expanded(
                    flex: 5,
                  child: Container(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
