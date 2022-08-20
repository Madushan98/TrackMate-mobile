import 'package:flutter/material.dart';
import '../../widgets/CustomFormField.dart';
import '../../widgets/infoTitle.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
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
              type: 'text',
              hint: 'NationalId',
              editableChange: () {},
              isEditable: false,
              onChangeFunction: () {},
              value: "982351030V",
            ),
            SizedBox(
              height: 5,
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: InfomationTitleWidget(
                value: 'First Name',
              ),
            ),
            FormFieldWidget(
              type: 'text',
              hint: 'NationalId',
              editableChange: () {},
              isEditable: false,
              onChangeFunction: () {},
              value: "Ranasinghe",
            ),
            SizedBox(
              height: 5,
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: InfomationTitleWidget(
                value: 'First Name',
              ),
            ),
            FormFieldWidget(
              type: 'text',
              hint: 'NationalId',
              editableChange: () {},
              isEditable: false,
              onChangeFunction: () {},
              value: "Madushan",
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: InfomationTitleWidget(
                value: 'First Name',
              ),
            ),
            FormFieldWidget(
              type: 'text',
              hint: 'NationalId',
              editableChange: () {},
              isEditable: false,
              onChangeFunction: () {},
              value: "18",
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: InfomationTitleWidget(
                value: 'First Name',
              ),
            ),
            FormFieldWidget(
              type: 'text',
              hint: 'NationalId',
              editableChange: () {},
              isEditable: false,
              onChangeFunction: () {},
              value: "074231313",
            ),
            SizedBox(
              height: 60,
            ),

          ],
        ),
      )),
    );
  }
}
