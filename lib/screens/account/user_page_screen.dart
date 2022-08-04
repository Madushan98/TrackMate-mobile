import 'package:flutter/cupertino.dart';
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
    return SingleChildScrollView(
        child: Container(
      child: Column(
        children: [
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
          Container(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.black,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black,
                                  offset: Offset(0, 4),
                                  blurRadius: 0)
                            ]),
                        padding: const EdgeInsets.all(14),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "Update",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: "Manrope",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.black,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black,
                                  offset: Offset(0, 4),
                                  blurRadius: 0)
                            ]),
                        padding: const EdgeInsets.all(14),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "Log Out",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: "Manrope",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    ));
  }
}
