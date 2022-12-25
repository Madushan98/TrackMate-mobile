import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/accountController/account_controller.dart';
import '../../../widgets/CustomFormField.dart';
import '../../../widgets/infoTitle.dart';

class VaccinationScreen extends StatefulWidget {
  const VaccinationScreen({Key? key}) : super(key: key);

  @override
  State<VaccinationScreen> createState() => _VaccinationScreenState();
}

class _VaccinationScreenState extends State<VaccinationScreen> {
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
                    value: 'Vaccination Type',
                  ),
                ),
                FormFieldWidget(
                  type: TextInputType.text,
                  hint: 'Vaccination Type',
                  editableChange: () {},
                  isEditable: false.obs,
                  onChangeFunction: () {},
                  value: _accountController.vaccinationDetails.value.vaccineType ?? " No Info ",
                ),
                SizedBox(
                  height: 5,
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: InfomationTitleWidget(
                    value: 'Vaccination Place',
                  ),
                ),
                FormFieldWidget(
                  type: TextInputType.number,
                  hint: 'Vaccination Place',
                  editableChange: () {},
                  isEditable: false.obs,
                  onChangeFunction: () {},
                  value: _accountController.vaccinationDetails.value.vaccinatedPlace ?? "No Info",
                ),
                SizedBox(
                  height: 5,
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: InfomationTitleWidget(
                    value: 'Dose No',
                  ),
                ),
                FormFieldWidget(
                  type: TextInputType.number,
                  hint: 'Dose',
                  editableChange: () {},
                  isEditable: false.obs,
                  onChangeFunction: () {},
                  value: _accountController.vaccinationDetails.value.vaccineDoseNumber.toString() ?? "No Info",
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          )),
    );
  }
}
