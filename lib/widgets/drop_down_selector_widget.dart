import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';



class DropDownSelectWidget extends StatefulWidget {
  DropDownSelectWidget({
    Key? key,
    required Size size, required this.dropDownList, required this.onChangedFunction, required this.topic,
  }): _size = size,
        super(key: key);

  final Size _size;
  final RxList<String> dropDownList ;
  final Function onChangedFunction ;

  final String topic ;


  @override
  State<DropDownSelectWidget> createState() => _DropDownSelectWidgetState();
}

class _DropDownSelectWidgetState extends State<DropDownSelectWidget> {

   var selectedValue ;
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 9.0),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10),
        child: Obx(() {
          return DropdownButtonHideUnderline(
            child: Container(
              width: widget._size.width,
              height: 60,
              decoration: BoxDecoration(
                color: Color(0xFFC4C4C4).withOpacity(0.25),
                borderRadius: new BorderRadius.circular(10),
              ),
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: DropdownButton<String>(
                      hint: Text(widget.topic),
                      value: selectedValue ,
                      onChanged: (newValue) {
                        widget.onChangedFunction(newValue);
                        setState(() {
                          selectedValue = newValue;
                        });
                        print(selectedValue);
                      },
                      items:widget.dropDownList
                          .map<DropdownMenuItem<String>>(
                              (String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value,
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
          );
        }),
      ),
    );
  }
}