import 'package:covid_safe_app/helper/dateTime.dart';
import 'package:covid_safe_app/widgets/PassLogWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../controllers/passControllers/user_pass_history_controller.dart';

class PassLogUserScreen extends StatefulWidget {
  PassLogUserScreen({Key? key}) : super(key: key);

  @override
  _PassLogUserScreenState createState() => _PassLogUserScreenState();
}

String qrData = "No data found!";
var data;
bool hasdata = false;

class _PassLogUserScreenState extends State<PassLogUserScreen> {
  final _userHistoryController = Get.put(UserPassHistoryController());

  @override
  void initState() {
    _userHistoryController.getScanHistoryData();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[900],
          title: Center(child: Text("Pass Logs")),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            _userHistoryController.getScanHistoryData();
          },
          child: SingleChildScrollView(
            child: Container(
              child: Obx(() {
                return _userHistoryController.isLoading.value
                    ? Container(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 20),
                          child: Container(
                            height: _size.height * 0.8,
                            width: _size.height,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircularProgressIndicator(
                                  color: Colors.grey[900],
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    : Container(
                        height: _size.height* 0.9,
                        child: Column(
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Expanded(
                                      flex: 10,
                                      child: Container()),
                                  Expanded(
                                    flex: 8,
                                    child: InkWell(
                                      onTap: (){
                                        _userHistoryController.selectDate(context);
                                      },
                                      child: Card(
                                        elevation: 2,
                                        color: Colors.grey[200],
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Container(
                                            child: Row(
                                              children: [
                                                Text(
                                                  "Date - " + getDateTime(_userHistoryController.selectedDate.value),
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      fontWeight: FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Icon(
                                                  Icons.calendar_month,
                                                  size: 13,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              height: _size.height * 0.8,
                              child: ListView.builder(
                                  itemCount: _userHistoryController.selectedDateLogHistory.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    var passLogHistory =
                                        _userHistoryController.selectedDateLogHistory[index];
                                    return PasslogWidget(passLogModel: passLogHistory);
                                  }),
                            ),
                          ],
                        ));
              }),
            ),
          ),
        ));
  }
}
