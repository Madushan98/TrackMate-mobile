import 'package:covid_safe_app/controllers/accountController/account_controller.dart';
import 'package:covid_safe_app/controllers/userController/organizationDetailsController.dart';
import 'package:covid_safe_app/widgets/FormWidgets/AuthFormFiled.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../widgets/CustomFormField.dart';
import '../../../widgets/drop_down_selector_widget.dart';

class OrganizationDetailsUpdateScreen extends StatefulWidget {
  const OrganizationDetailsUpdateScreen({Key? key}) : super(key: key);

  @override
  State<OrganizationDetailsUpdateScreen> createState() => _OrganizationDetailsUpdateScreenState();
}

class _OrganizationDetailsUpdateScreenState extends State<OrganizationDetailsUpdateScreen> {

  var _organizationController =  Get.put(OrganizationDataController());

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

                                _organizationController.selectedOrganizationName.value =
                                    value;
                                _organizationController.selectOrganization(value);
                                _organizationController.update();
                              },
                              size: _size,
                              dropDownList: _organizationController.organizationList,
                              topic: 'Select Option',
                            ),

                            AuthFormFieldWidget(size: _size, icon: Icons.edit, hintText: "Employee Id", updateValue:(value) {
                              _organizationController.employeeNum.value =
                                  value;
                              _organizationController.update();
                            },),
                              AuthFormFieldWidget(size: _size, icon: Icons.edit, hintText: "Contact No", updateValue:(value) {
                                _organizationController.contactNo.value =
                                    value;
                                _organizationController.update();
                              },),



                          ],
                        ),
                      ),
                      SizedBox(
                        height: 80,
                      ),
                      _organizationController.isLoading.value
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
                                        _organizationController.updateOrganizationDetails();
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
                  ));
            }),
          ),
        ));
  }
}
