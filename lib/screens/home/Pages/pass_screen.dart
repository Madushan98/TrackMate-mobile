import 'package:covid_safe_app/controllers/passControllers/pass-manger_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../routes/appPages.dart';
import '../../qrCode/qr_screen.dart';

// Pass Screen  Shows All  Passes of the user
class PassScreen extends StatefulWidget {
  const PassScreen({Key? key}) : super(key: key);

  @override
  State<PassScreen> createState() => _PassScreenState();
}

class _PassScreenState extends State<PassScreen> {
  final _passController = Get.put(PassManagerController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return Scaffold(
        floatingActionButton: Container(
          width: 50,
          height: 50,
          child: FloatingActionButton(
            backgroundColor: Colors.grey[900],
            child: Icon(
              Icons.add,
              size: 30,
              color: Colors.yellow[800],
            ),
            onPressed: () {
              _passController.goToCreatePass();
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Obx(() {
            return RefreshIndicator(
              onRefresh: () async {
                _passController.getAllPasses();
              },
              child: Container(
                  child: Column(
                children: [
                  Material(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only()),
                    color: Colors.grey[900],
                    child: Container(
                      height: _size.height * 0.1,
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
                  _passController.isLoading.value
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
                          height: _size.height,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: ListView.builder(
                                itemCount: _passController.passList.length,
                                itemBuilder: (BuildContext context, int index) {
                                  var pass = _passController.passList[index];
                                  return InkWell(
                                    onTap: () {
                                      Get.toNamed(Routes.QrCodeScreen,
                                          arguments: QrCodeScreen(
                                            passId: pass.id!,
                                          ));
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
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                flex: 6,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "${pass.passCategory}",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 20),
                                                    ),
                                                    Text(
                                                        "Generated Time : ${pass.generatedDateTime}")
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                flex: 4,
                                                child: Column(
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          Alignment.centerRight,
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
                                                          Icons
                                                              .arrow_circle_right_rounded,
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
                                  );
                                }),
                          )),
                ],
              )),
            );
          }),
        ));
  }
}
