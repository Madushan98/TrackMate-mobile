import 'dart:convert';

import 'package:covid_safe_app/configuration/app_constants.dart';
import 'package:covid_safe_app/models/User/UserModel.dart';
import 'package:covid_safe_app/models/User/VaccinationDetails.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import '../../models/Organzation/OrganizationModel.dart';
import '../../routes/appPages.dart';
import '../../service/Authentication/AuthService.dart';
import '../../service/User/UserService.dart';

class AccountController extends GetxController {
  var natId = "".obs;
  var userName = "".obs;
  var isLoading = false.obs;
  var isVerified = "".obs;
  final userRxn = Rxn<User>();
  var isVaccinated = false.obs;
  var vaccinationDetails = VaccinationDetails().obs;
  var organizationDetails = OrganizationModel().obs;
  var _authService = Get.find<AuthService>();
  var _userServices = Get.find<UserService>();

  @override
  void onInit() {
    loadData();
    super.onInit();
  }

  loadData() async {
    isLoading.value = true;
    User user = await _authService.reloadUserDetails();
    userRxn.value = user;
    userName.value = user.fullName!;
    natId.value = user.nationalId!;
    getVaccineData(user.id!);
    isVerified.value = user.isVertified ?? VerificationStatus.notVerified;
    isLoading.value = false;
    update();
    loadVaccineData(user.id!);
  }

  loadVaccineData(userId) async {
    List<VaccinationDetails> vaccinatedData =
        await _authService.getVaccineData(userId);
    if (vaccinatedData.length >= 1) {
      isVaccinated.value = true;
      vaccinationDetails.value = vaccinatedData.last;
    } else {
      isVaccinated.value = false;
    }
    update();
  }

  getVaccineData(String userId) async {
    isLoading.value = true;
    await _authService.getVaccineData(userId);
    isLoading.value = false;
    update();
  }

  goToUserDetails() {
    print("user_page");
    Get.toNamed(Routes.User);
  }

  getUserOrganization() async {
    var organizationData = await _userServices.getUserOrganization();
    if (organizationData != null) {
      organizationDetails.value = organizationData;
    }
    update();
  }

  Future<void> logOut() async {
    _authService.LogOut();
    Get.offAllNamed(Routes.Login);
  }
}
