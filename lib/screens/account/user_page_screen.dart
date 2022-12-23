import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/accountController/account_controller.dart';
import '../../widgets/CustomFormField.dart';
import '../../widgets/infoTitle.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
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
                value: 'Full Name',
              ),
            ),
            FormFieldWidget(
              type: TextInputType.text,
              hint: 'Full Name',
              editableChange: () {},
              isEditable: false.obs,
              onChangeFunction: () {},
              value: _accountController.userName.value,
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
              value: _accountController.userRxn.value?.primaryContactNumber ??
                  'No Info',
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
