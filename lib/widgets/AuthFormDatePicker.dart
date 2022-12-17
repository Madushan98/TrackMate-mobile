import 'package:covid_safe_app/helper/dateTime.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class AuthFormDatePickerWidget extends StatefulWidget {
  const AuthFormDatePickerWidget({
    Key? key,
    required Size size,
    required this.icon,
    this.initValue = "",
    this.textInputType = TextInputType.datetime,
    required this.hintText,
    required this.updateValue,
  })  : _size = size,
        super(key: key);

  final Size _size;
  final String initValue;
  final IconData icon;
  final TextInputType textInputType;
  final String hintText;
  final Function updateValue;

  @override
  State<AuthFormDatePickerWidget> createState() =>
      _AuthFormDatePickerWidgetState();
}

class _AuthFormDatePickerWidgetState extends State<AuthFormDatePickerWidget> {
  DateTime dateTime = DateTime.now();

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
                    child: InkWell(
                      onTap: () {
                        DatePicker.showDatePicker(context,
                            showTitleActions: true,
                            minTime: DateTime(1998, 3, 5),
                            maxTime: DateTime(2025, 6, 7), onChanged: (date) {
                          print('change $date');
                        }, onConfirm: (date) {
                          setState(() {
                            dateTime = date;
                          });
                          widget.updateValue(date);
                        }, currentTime: DateTime.now(), locale: LocaleType.en);
                      },
                      child: Text(getDateTime(dateTime),
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w300,
                              fontSize: 16)),
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
                          widget.icon,
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
