import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PassScreen extends StatefulWidget {
  const PassScreen({Key? key}) : super(key: key);

  @override
  State<PassScreen> createState() => _PassScreenState();
}

class _PassScreenState extends State<PassScreen> {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.grey[900],
          child: Icon(
            Icons.add,
            size: 40,
            color: Colors.yellow[800],
          ),
          onPressed: () {},
        ),
        body: SingleChildScrollView(
          child: Container(
              child: Column(
            children: [
              Material(
                elevation: 4,
                shape:
                    RoundedRectangleBorder(borderRadius: BorderRadius.only()),
                color: Colors.grey[900],
                child: Container(
                  height: _size.height * 0.08,
                  width: _size.width,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            "Digital Pass",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Icon(
                              Icons.qr_code,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: _size.height,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: ListView(
                    children: [
                      InkWell(
                        onTap: (){

                        },
                        child: Card(
                          elevation: 1,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 15),
                            child: Container(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    flex: 6,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "QR Code For work Transportation",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                        Text("Last Updated : 2022-12-18 5.00 PM")
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: Column(

                                      children: [
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Icon(
                                            Icons.qr_code_2,
                                            size: 60,
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Icon(
                                              Icons.arrow_circle_right_rounded,
                                              size: 20,
                                            ),

                                            Icon(
                                              Icons.delete_rounded,
                                              size: 20,
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          )),
        ));
  }
}
