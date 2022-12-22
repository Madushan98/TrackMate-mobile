import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widgets/CustomFormField.dart';
import '../../../widgets/infoTitle.dart';

class VaccinationScreen extends StatefulWidget {
  const VaccinationScreen({Key? key}) : super(key: key);

  @override
  State<VaccinationScreen> createState() => _VaccinationScreenState();
}

class _VaccinationScreenState extends State<VaccinationScreen> {
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
                  value: "982351030V",
                ),
                SizedBox(
                  height: 5,
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: InfomationTitleWidget(
                    value: 'Full Name',
                  ),
                ),
                FormFieldWidget(
                  type: TextInputType.text,
                  hint: 'Full Name',
                  editableChange: () {},
                  isEditable: false.obs,
                  onChangeFunction: () {},
                  value: "Ranasinghe",
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
                  value: "0712313131",
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
