import 'package:covid_safe_app/helper/dateTime.dart';
import 'package:covid_safe_app/models/User/VaccinationDetails.dart';
import 'package:covid_safe_app/screens/account/Vaccination/vaccination_details_update_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controllers/accountController/account_controller.dart';
import '../../screens/account/Organization/organization_update_screen.dart';

class VaccinationDetailsSetWidget extends StatelessWidget {
   VaccinationDetailsSetWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      // Set Vaccine  Details Widget
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 6,
              child: Text(
                "Set Your Vaccine Details",
                style:
                TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: InkWell(
                  onTap: (){
                    Get.to(VaccinationDetailsUpdateScreen());
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Center(
                      child: Text(
                        "Set",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(flex: 1, child: Container())
          ],
        ),
      ),
    );
  }
}

class VaccinationDetailsShowWidget extends StatelessWidget {
  VaccinationDetailsShowWidget({
    Key? key,  this.vaccinationDetails,
  }) : super(key: key);

  final VaccinationDetails? vaccinationDetails;


  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Container(
        height: 60,
        // Set Vaccine  Details Widget
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Vaccination Details",
                      style:
                      TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                    ),

                    Expanded(flex: 1, child: Container())
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Center(
                          child: Text(
                            "Dose - " + (vaccinationDetails?.vaccineDoseNumber.toString() ?? "Not Set"),
                            style: TextStyle(
                                color: Colors.white, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Text(
                        "Date- " + (getDateTimeString(vaccinationDetails!.vaccinatedDate!)
                            ?? "Not Set"),
                        style:
                        TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Center(
                          child: Text(
                            vaccinationDetails?.vaccineType ?? "Not Set",
                            style: TextStyle(
                                color: Colors.white, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),

                    Expanded(flex: 1, child: Container())
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

class OrganizationDetailsSetWidget extends StatelessWidget {
  const OrganizationDetailsSetWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // Set Organization  Details Widget
      color: Colors.grey[900],
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 6,
                  child: Text(
                    "Account Is Not Activated  ",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: InkWell(
                    onTap: () {
                      Get.to(() => OrganizationDetailsUpdateScreen());
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Center(
                          child: Text(
                            "Activate",
                            style: TextStyle(
                                color: Colors.black, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(flex: 1, child: Container())
              ],
            ),
          ),
        ),
      ),
    );
  }
}





class VerificationStatusPendingWidget extends StatelessWidget {
  const VerificationStatusPendingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // Set Organization  Details Widget
      color: Colors.grey[900],
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 6,
                  child: Text(
                    "Account Activation Is Pending  ",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                ),

                Expanded(flex: 1, child: Container())
              ],
            ),
          ),
        ),
      ),
    );
  }
}
