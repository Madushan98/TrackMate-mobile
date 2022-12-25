import 'package:covid_safe_app/controllers/passControllers/pass-manger_controller.dart';
import 'package:covid_safe_app/models/PassData/NewPassModel.dart';
import 'package:covid_safe_app/screens/home/verify_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../../configuration/app_constants.dart';
import '../../../controllers/passControllers/create_pass_controller.dart';
import '../../../widgets/FormWidgets/AuthFormDatePicker.dart';
import '../../../widgets/CustomFormField.dart';
import '../../../widgets/FormWidgets/AuthFormFiled.dart';
import '../../../widgets/drop_down_selector_widget.dart';

class NewPassScreen extends StatefulWidget {
  const NewPassScreen({Key? key}) : super(key: key);

  @override
  State<NewPassScreen> createState() => _NewPassScreenState();
}

class _NewPassScreenState extends State<NewPassScreen> {
  final _createPassController = Get.put(CreatePassController());
  final _passController = Get.put(PassManagerController());

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[900],
          title: Text(
            "Create Pass",
            style: GoogleFonts.roboto(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Obx(() {
              return  _passController.isVerified.value == VerificationStatus.verified ?  Container(
                  child: Column(
                children: [
                  Container(
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
                                  _createPassController.selectedOption.value =
                                      value;
                                  _createPassController.update();
                                },
                                size: _size,
                                dropDownList: _createPassController.typeOptions,
                                topic: 'Select Option',
                              ),
                              DropDownSelectWidget(
                                onChangedFunction: (value) {
                                  _createPassController.selectedInterval.value =
                                      value;
                                  _createPassController.update();
                                },
                                size: _size,
                                dropDownList:
                                _createPassController.intervalOptions,
                                topic: 'Reoccur',
                              ),
                              AuthFormDatePickerWidget(
                                size: _size,
                                hintText: 'Start Date',
                                icon: Icons.calendar_month,
                                updateValue: (value) {
                                  var date =
                                      DateTime.parse(value.toString()).toUtc();
                                  _createPassController.startDate.value =
                                      date.toString();
                                  _createPassController.update();
                                },
                              ),
                              AuthFormDatePickerWidget(
                                size: _size,
                                hintText: 'End Date',
                                icon: Icons.calendar_month,
                                updateValue: (value) {
                                  print(value);
                                  var date =
                                      DateTime.parse(value.toString()).toUtc();
                                  _createPassController.endDate.value =
                                      date.toString();
                                  _createPassController.update();
                                },
                              ),
                              AuthFormFieldWidget(
                                size: _size,
                                icon: Icons.edit,
                                hintText: "Pass Details",
                                updateValue: (value) {
                                  _createPassController.passTitle.value =
                                      value;
                                  _createPassController.update();
                                },
                              ),
                              AuthFormFieldWidget(
                                size: _size,
                                icon: Icons.edit,
                                hintText: "From",
                                updateValue: (value) {
                                  _createPassController.from.value =
                                      value;
                                  _createPassController.update();
                                },
                              ),
                              AuthFormFieldWidget(
                                size: _size,
                                icon: Icons.edit,
                                hintText: "To",
                                updateValue: (value) {
                                  _createPassController.to.value =
                                      value;
                                  _createPassController.update();
                                },
                              ),
                            ],
                          ),
                        ),
                  SizedBox(
                    height: 40,
                  ),
                  _createPassController.isLoading.value
                      ? Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CircularProgressIndicator(
                                color: Colors.grey[900],
                              ),
                            ],
                          ),
                        )
                      : Align(
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
                                        onTap: () {
                                          _createPassController.createPass(context);
                                        },
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
              )) : Container(
                  height: _size.height*0.6,
                  child: Center(child: VerificationScreen()));
            }),
          ),
        ));
  }
}
