import 'package:covid_safe_app/controllers/covidDataController/covid_data_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../configuration/styles/colors.dart';
import '../../widgets/counter.dart';

class CovidDataScreen extends StatefulWidget {
  const CovidDataScreen({Key? key}) : super(key: key);

  @override
  State<CovidDataScreen> createState() => _CovidDataScreenState();
}

class _CovidDataScreenState extends State<CovidDataScreen> {
  final _covidDataController = Get.put(CovidDataController());

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery
        .of(context)
        .size;
    return Obx(() {
      return Container(
        child: _covidDataController.isLoading.value
            ? Container(
          height: _size.height * 0.6,
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 30, vertical: 20),
            child: Container(
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
            :

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Case Update\n",
                          style: dashTextstyle,
                        ),
                        TextSpan(
                          text: _covidDataController.covidData.value.data?.updateDateTime,
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Text(
                    "See details",
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[900],
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 4),
                      blurRadius: 30,
                      color: kShadowColor,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Counter(
                      color: Colors.white,
                      number: _covidDataController.covidData.value.data?.globalNewCases.toString() ?? "No INfo",
                      title: "Global New Case",
                    ),
                    Counter(
                      color: Colors.white,
                      number: _covidDataController.covidData.value.data?.localNewCases.toString() ?? "No INfo",
                      title: "Local New Cases",
                    ),
                    Counter(
                      color: Colors.white,
                      number: _covidDataController.covidData.value.data?.localNewDeaths.toString() ?? "No INfo",
                      title: "Local New Deaths",
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: <Widget>[
              //     Text(
              //       "Spread of Virus",
              //       style: dashTextstyle,
              //     ),
              //     Text(
              //       "See details",
              //       style: TextStyle(
              //         color: kPrimaryColor,
              //         fontWeight: FontWeight.w600,
              //       ),
              //     ),
              //   ],
              // ),
              // Container(
              //   margin: EdgeInsets.only(top: 20),
              //   padding: EdgeInsets.all(20),
              //   height: 178,
              //   width: double.infinity,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(20),
              //     color: Colors.white,
              //   ),
              //   child: Image.asset(
              //     "assets/images/dash/map.png",
              //     fit: BoxFit.contain,
              //   ),
              // ),
            ],
          ),
        ),
      );
    });
  }
}
