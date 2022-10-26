import 'package:covid_safe_app/models/PassData/PassHistoryModel.dart';
import 'package:covid_safe_app/models/PassData/PassLogModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PasslogWidget extends StatelessWidget {
  const PasslogWidget({
    Key? key, required this.passLogModel,
  }) : super(key: key);

  final PassHistoryModel passLogModel ;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 2),
            child: Container(
              child: Card(
                child: Row(
                  children: [
                    Flexible(
                      child: Container(
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Text(
                                      "PassID ${passLogModel.passId}",
                                      style: TextStyle(
                                        overflow: TextOverflow.fade,
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    child: Text(
                                      "Date          - ${passLogModel.getDateOnly()}",
                                      style: TextStyle(
                                        overflow: TextOverflow.fade,
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    child: Text(
                                      "LogTime        - ${passLogModel.getTimeOnly()}",
                                      style: TextStyle(
                                        overflow: TextOverflow.fade,
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    child: Text(
                                      "ScannerID   - ${passLogModel.scannerId}",
                                      style: TextStyle(
                                        overflow: TextOverflow.fade,
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  // Container(
                                  //   child: Text(
                                  //     "Pass -" +
                                  //             passLogModel. ??
                                  //         "No Info",
                                  //     style: TextStyle(
                                  //       overflow: TextOverflow.fade,
                                  //       fontSize: 16,
                                  //       color: Colors.black,
                                  //       fontWeight: FontWeight.w500,
                                  //     ),
                                  //   ),
                                  // ),
                                ],
                              ),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            )));
  }
}
