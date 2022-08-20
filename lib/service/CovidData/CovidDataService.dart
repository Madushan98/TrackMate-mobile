
import 'dart:convert';

import 'package:covid_safe_app/configuration/app_config.dart';
import 'package:covid_safe_app/models/CovidData/CovidDataModel.dart';

import '../../configuration/base_client.dart';

class CovidDataService {

  Future<CovidDataModel> getCovidData() async {
    var token = await BaseClient().get(
      covidDataUrl,
      "",
    );
    final jsonData = jsonDecode(token);
    var covidData = CovidDataModel.fromJson(jsonData);


    return covidData;
  }

}