import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../widgets/CustomFormField.dart';
import '../../../widgets/infoTitle.dart';
import '../../../widgets/profileAvatar.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  String imageUrl =
      'https://img.freepik.com/free-photo/handsome-young-businessman-shirt-eyeglasses_85574-6228.jpg?size=626&ext=jpg';

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Container(
        width: _size.width,
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              child: ProfileAvatar(imageUrl: imageUrl),
            ),
            Container(
              child: Text("Madushan Ranasinghe",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 20)),
            ),
            Container(
              child: Text("982351030V",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 15)),
            ),
            SizedBox(
              height: 30,
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
              height: 40,
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
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
                              ]
                          ),
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
                              ]
                          ),
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
      ),
    );
  }
}
