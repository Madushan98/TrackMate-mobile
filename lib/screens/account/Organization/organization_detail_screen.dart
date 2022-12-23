import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../controllers/accountController/account_controller.dart';
import '../../../widgets/CustomFormField.dart';
import '../../../widgets/infoTitle.dart';

class OrganizationDetailScreen extends StatefulWidget {
  const OrganizationDetailScreen({Key? key}) : super(key: key);

  @override
  State<OrganizationDetailScreen> createState() => _OrganizationDetailScreenState();
}

class _OrganizationDetailScreenState extends State<OrganizationDetailScreen> {


  final _accountController = Get.put(AccountController());

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
            height: _size.height,
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: InfomationTitleWidget(
                    value: 'National ID',
                  ),
                ),
                FormFieldWidget(
                  type: TextInputType.text,
                  hint: 'NationalId',
                  editableChange: () {},
                  isEditable: false.obs,
                  onChangeFunction: () {},
                  value: _accountController.natId.value,
                ),
                SizedBox(
                  height: 5,
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: InfomationTitleWidget(
                    value: 'Organization Name',
                  ),
                ),
                FormFieldWidget(
                  type: TextInputType.text,
                  hint: 'Organization Name',
                  editableChange: () {},
                  isEditable: false.obs,
                  onChangeFunction: () {},
                  value: _accountController.organizationDetails.value.organizationName ?? "No Info",
                ),
                SizedBox(
                  height: 5,
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: InfomationTitleWidget(
                    value: 'Organization Type',
                  ),
                ),
                FormFieldWidget(
                  type: TextInputType.number,
                  hint: 'Organization Type',
                  editableChange: () {},
                  isEditable: false.obs,
                  onChangeFunction: () {},
                  value: _accountController.organizationDetails.value.organizationType ?? "No Info",
                ),
                SizedBox(
                  height: 5,
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: InfomationTitleWidget(
                    value: 'Contact Number',
                  ),
                ),
                FormFieldWidget(
                  type: TextInputType.number,
                  hint: 'Contact Number',
                  editableChange: () {},
                  isEditable: false.obs,
                  onChangeFunction: () {},
                  value: _accountController.organizationDetails.value.mobileNumber ?? "No Info",
                ),
                SizedBox(
                  height: 5,
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: InfomationTitleWidget(
                    value: 'E-mail',
                  ),
                ),
                FormFieldWidget(
                  type: TextInputType.number,
                  hint: 'E-mail',
                  editableChange: () {},
                  isEditable: false.obs,
                  onChangeFunction: () {},
                  value: _accountController.organizationDetails.value.emailAddress ?? "No Info",
                ),
              ],
            ),
          )),
    );
  }
}