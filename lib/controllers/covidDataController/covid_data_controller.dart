import 'package:covid_safe_app/models/CovidData/CovidDataModel.dart';
import 'package:covid_safe_app/service/CovidData/CovidDataService.dart';
import 'package:get/get.dart';
import '../baseController.dart';

class CovidDataController extends GetxController with BaseController {
  var _covidDataService = Get.find<CovidDataService>();
  var covidData = CovidDataModel().obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    setData();
    super.onInit();
  }


  setData() async {
    isLoading.value = true;

    covidData.value = await getCovidData();

    isLoading.value = false;
    update();
  }

  Future<CovidDataModel> getCovidData() async {
    var covidData = await _covidDataService.getCovidData();
    return covidData;
  }
}
