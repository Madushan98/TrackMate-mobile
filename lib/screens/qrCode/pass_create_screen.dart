import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../controllers/passControllers/create_pass_controller.dart';
import '../../widgets/AuthFormDatePicker.dart';
import '../../widgets/CustomFormField.dart';
import '../../widgets/drop_down_selector_widget.dart';

class NewPassScreen extends StatefulWidget {
  const NewPassScreen({Key? key}) : super(key: key);

  @override
  State<NewPassScreen> createState() => _NewPassScreenState();
}

class _NewPassScreenState extends State<NewPassScreen> {
  final _createPassController = Get.put(CreatePassController());

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(body: Container(
      child: SingleChildScrollView(
        child: Obx(() {
          return Container(
              child: Column(
            children: [
              Material(
                elevation: 4,
                shape:
                    RoundedRectangleBorder(borderRadius: BorderRadius.only()),
                color: Colors.grey[900],
                child: Container(
                  height: _size.height * 0.08,
                  width: _size.width,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            "Digital Pass",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Icon(
                              Icons.qr_code,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              _createPassController.isLoading.value
                  ? Container()
                  : Container(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 40,
                          ),
                          FormFieldWidget(
                              value: _createPassController.nationalID.value,
                              onChangeFunction: () {},
                              isEditable: false.obs,
                              editableChange: () {},
                              type: TextInputType.text,
                              hint: "National Id"),
                          DropDownSelectWidget(
                            onChangedFunction: (value) {
                              _createPassController.selectedOption.value = value;
                              _createPassController.update();
                            },
                            size: _size,
                            dropDownList: _createPassController.options,
                            topic: 'Select Option',
                          ),
                          DropDownSelectWidget(
                            onChangedFunction: (value) {
                              _createPassController.isReoucuring.value = value;
                              _createPassController.update();
                            },
                            size: _size,
                            dropDownList: _createPassController.options,
                            topic: 'Is reOccurring',
                          ),
                          AuthFormDatePickerWidget(
                            size: _size,
                            hintText: 'Start Date',
                            icon: Icons.calendar_month,
                            updateValue: (value) {
                              _createPassController.startDate = value;
                              _createPassController.update();
                            },
                          ),
                          AuthFormDatePickerWidget(
                            size: _size,
                            hintText: 'End Date',
                            icon: Icons.calendar_month,
                            updateValue: (value) {
                              _createPassController.endDate = value;
                              _createPassController.update();
                            },
                          ),
                        ],
                      ),
                    ),
              SizedBox(
                height: 80,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Material(
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      width: double.infinity,
                      height: _size.height * 0.075,
                      child: Padding(
                        padding: EdgeInsets.only(right: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            InkWell(
                              onTap: () {},
                              child: Text(
                                'SAVE & CONTINUE',
                                style: GoogleFonts.manrope(
                                  textStyle: TextStyle(
                                      color: Colors.black,
                                      height: 1.4,
                                      letterSpacing: .4,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                            SizedBox(width: 8.0),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.black,
                              size: 16.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ));
        }),
      ),
    ));
  }
}
