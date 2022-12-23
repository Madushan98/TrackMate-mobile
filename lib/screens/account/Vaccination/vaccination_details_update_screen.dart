import 'package:covid_safe_app/controllers/userController/vaccinationDataController.dart';
import 'package:covid_safe_app/widgets/CustomFormField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../widgets/FormWidgets/AuthFormDatePicker.dart';
import '../../../widgets/FormWidgets/AuthFormFiled.dart';
import '../../../widgets/drop_down_selector_widget.dart';

class VaccinationDetailsUpdateScreen extends StatefulWidget {
  const VaccinationDetailsUpdateScreen({Key? key}) : super(key: key);

  @override
  State<VaccinationDetailsUpdateScreen> createState() =>
      _VaccinationDetailsUpdateScreenState();
}

class _VaccinationDetailsUpdateScreenState
    extends State<VaccinationDetailsUpdateScreen> {
  var _vaccinationController = Get.put(VaccinationDataController());

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[900],
          title: Text(
            "Add Vaccination Details",
            style: GoogleFonts.roboto(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Obx(() {
              return Container(
                      child: Column(
                      children: [
                        Container(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 40,
                              ),
                              DropDownSelectWidget(
                                onChangedFunction: (value) {
                                  _vaccinationController
                                      .selectedVaccineType.value = value;
                                  _vaccinationController
                                      .selectedVaccineType(value);
                                  _vaccinationController.update();
                                },
                                size: _size,
                                dropDownList:
                                    _vaccinationController.vaccinationType,
                                topic: 'Select Option',
                              ),
                              AuthFormFieldWidget(
                                size: _size,
                                icon: Icons.edit,
                                hintText: "Vaccination Place",
                                updateValue: (value) {
                                  _vaccinationController.vaccinatedPlace.value =
                                      value;
                                  _vaccinationController.update();
                                },
                              ),
                              AuthFormFieldWidget(
                                size: _size,
                                icon: Icons.edit,
                                hintText: "Vaccination Dose Number",
                                updateValue: (value) {
                                  _vaccinationController.doseNumber.value =
                                      value;
                                  _vaccinationController.update();
                                },
                                textInputType: TextInputType.number,
                              ),
                              AuthFormDatePickerWidget(
                                size: _size,
                                hintText: 'Vaccinated Date',
                                icon: Icons.calendar_month,
                                updateValue: (value) {
                                  var date =
                                  DateTime.parse(value.toString()).toUtc();
                                  _vaccinationController.selectedDate.value =
                                      date.toString();
                                  _vaccinationController.update();
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 80,
                        ),
                        _vaccinationController.isLoading.value
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            InkWell(
                                              onTap: () {
                                                _vaccinationController
                                                    .updateVaccinationDetails();
                                              },
                                              child: Text(
                                                'SAVE & CONTINUE',
                                                style: GoogleFonts.manrope(
                                                  textStyle: TextStyle(
                                                      color: Colors.black,
                                                      height: 1.4,
                                                      letterSpacing: .4,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600),
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
