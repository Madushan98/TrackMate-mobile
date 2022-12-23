import 'package:covid_safe_app/models/User/createVaccinationData.dart';
import 'package:covid_safe_app/screens/LoadingStatus.dart';
import 'package:covid_safe_app/service/Authentication/AuthService.dart';
import 'package:get/get.dart';
import '../accountController/account_controller.dart';

class VaccinationDataController extends GetxController {
  var isLoading = false.obs;
  var _authService = Get.find<AuthService>();
  var _accountController = Get.put(AccountController());
  var nationalID = "".obs;
  var userID = "".obs;
  var vaccinationType = RxList<String>();
  var selectedVaccineType = "".obs;
  var selectedDate = "".obs;
  var doseNumber = "".obs;
  var vaccinatedPlace = "".obs;

  @override
  void onInit() {
    addVaccinationOptions();
    getUserDetails();
    super.onInit();
  }

  getUserDetails() async {
    var userDetails = await _authService.getUserDetails();
    nationalID.value = userDetails.nationalId!;
    userID.value = userDetails.id!;
    update();
  }

  addVaccinationOptions() {
    vaccinationType.add("Pfizer");
    vaccinationType.add("CoviSheild");
    vaccinationType.add("Moderna");
    vaccinationType.add("AstraZeneca");
    update();
  }

  updateVaccinationDetails() async {
    isLoading.value = true;
    CreateVaccinationData createVaccinationData = CreateVaccinationData(
        vaccineType: selectedVaccineType.value,
        userId: userID.value,
        vaccinatedDate: selectedDate.value,
        vaccinatedPlace: vaccinatedPlace.value,
        vaccineDoseNumber: int.parse(doseNumber.value));

    var response =
        await _authService.updateVaccinationDetails(createVaccinationData);

    if (response) {
      _accountController.loadData();
      _accountController.update();
      isLoading.value = false;
      Get.back();
    } else {
      isLoading.value = false;
      update();
      LoadingStatus.showErroDialog(
          description: "Something went wrong", context: Get.context!);
    }
  }
}
