import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class FormFieldWidget extends StatelessWidget {
  const FormFieldWidget({
    Key? key,
    required this.value,
    required this.onChangeFunction,
    required this.isEditable,
    required this.editableChange,
    required this.type,
    required this.hint,
  }) : super(key: key);

  final String value;
  final Function onChangeFunction;
  final bool isEditable;
  final Function editableChange;
  final String type;
  final String hint;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 15.0),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Color(0xFFC4C4C4).withOpacity(0.25),
          borderRadius: new BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: isEditable
              ? Row(
                  children: [
                    Expanded(
                        flex: 10,
                        child: TextFormField(
                          keyboardType: type == 'number'
                              ? TextInputType.number
                              : TextInputType.text,
                          initialValue: value,
                          decoration: InputDecoration(
                            border: InputBorder.none,

                            isDense: true,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 0, vertical: 5),
//                          labelText: value.value,
                          ),
                          onChanged: (text) {
                            onChangeFunction(text);
                          },
                        )),
                    Expanded(
                      flex: 7,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () {
                            editableChange(false);
                          },
                          child: Text(
                            'Ok',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 16),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 15,
                      child: Text(
                        value == "" ? hint : value,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 16),
                      ),
                    ),
                    Expanded(
                      flex: 7,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                            onTap: () {
                              editableChange(true);
                            },
                            child: Icon(Icons.edit,
                                size: 15, color: Colors.grey[500])),
                      ),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
