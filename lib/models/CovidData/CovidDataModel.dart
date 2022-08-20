/// success : true
/// message : "Success"
/// data : {"update_date_time":"2022-07-31 02:27:11","local_new_cases":0,"local_total_cases":665626,"local_total_number_of_individuals_in_hospitals":0,"local_deaths":16556,"local_new_deaths":0,"local_recovered":648148,"local_active_cases":922,"global_new_cases":510016,"global_total_cases":249461042,"global_deaths":5047622,"global_new_deaths":7456,"global_recovered":225913434,"total_pcr_testing_count":6524460}

class CovidDataModel {
  CovidDataModel({
    this.success,
    this.message,
    this.data,
  });

  CovidDataModel.fromJson(dynamic json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? success;
  String? message;
  Data? data;
  CovidDataModel copyWith({
    bool? success,
    String? message,
    Data? data,
  }) =>
      CovidDataModel(
        success: success ?? this.success,
        message: message ?? this.message,
        data: data ?? this.data,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
}

/// update_date_time : "2022-07-31 02:27:11"
/// local_new_cases : 0
/// local_total_cases : 665626
/// local_total_number_of_individuals_in_hospitals : 0
/// local_deaths : 16556
/// local_new_deaths : 0
/// local_recovered : 648148
/// local_active_cases : 922
/// global_new_cases : 510016
/// global_total_cases : 249461042
/// global_deaths : 5047622
/// global_new_deaths : 7456
/// global_recovered : 225913434
/// total_pcr_testing_count : 6524460

class Data {
  Data({
    this.updateDateTime,
    this.localNewCases,
    this.localTotalCases,
    this.localTotalNumberOfIndividualsInHospitals,
    this.localDeaths,
    this.localNewDeaths,
    this.localRecovered,
    this.localActiveCases,
    this.globalNewCases,
    this.globalTotalCases,
    this.globalDeaths,
    this.globalNewDeaths,
    this.globalRecovered,
    this.totalPcrTestingCount,
  });

  @override
  String toString() {
    return 'Data{updateDateTime: $updateDateTime, localNewCases: $localNewCases,'
        ' localTotalCases: $localTotalCases, localTotalNumberOfIndividualsInHospitals:'
        ' $localTotalNumberOfIndividualsInHospitals, localDeaths: $localDeaths, localNewDeaths: '
        '$localNewDeaths, localRecovered: $localRecovered, localActiveCases: $localActiveCases,'
        ' globalNewCases: $globalNewCases, globalTotalCases: $globalTotalCases, globalDeaths: $globalDeaths,'
        ' globalNewDeaths: $globalNewDeaths, globalRecovered: $globalRecovered, totalPcrTestingCount: $totalPcrTestingCount}';
  }

  Data.fromJson(dynamic json) {
    updateDateTime = json['update_date_time'];
    localNewCases = json['local_new_cases'];
    localTotalCases = json['local_total_cases'];
    localTotalNumberOfIndividualsInHospitals =
        json['local_total_number_of_individuals_in_hospitals'];
    localDeaths = json['local_deaths'];
    localNewDeaths = json['local_new_deaths'];
    localRecovered = json['local_recovered'];
    localActiveCases = json['local_active_cases'];
    globalNewCases = json['global_new_cases'];
    globalTotalCases = json['global_total_cases'];
    globalDeaths = json['global_deaths'];
    globalNewDeaths = json['global_new_deaths'];
    globalRecovered = json['global_recovered'];
    totalPcrTestingCount = json['total_pcr_testing_count'];
  }
  String? updateDateTime;
  int? localNewCases;
  int? localTotalCases;
  int? localTotalNumberOfIndividualsInHospitals;
  int? localDeaths;
  int? localNewDeaths;
  int? localRecovered;
  int? localActiveCases;
  int? globalNewCases;
  int? globalTotalCases;
  int? globalDeaths;
  int? globalNewDeaths;
  int? globalRecovered;
  int? totalPcrTestingCount;
  Data copyWith({
    String? updateDateTime,
    int? localNewCases,
    int? localTotalCases,
    int? localTotalNumberOfIndividualsInHospitals,
    int? localDeaths,
    int? localNewDeaths,
    int? localRecovered,
    int? localActiveCases,
    int? globalNewCases,
    int? globalTotalCases,
    int? globalDeaths,
    int? globalNewDeaths,
    int? globalRecovered,
    int? totalPcrTestingCount,
  }) =>
      Data(
        updateDateTime: updateDateTime ?? this.updateDateTime,
        localNewCases: localNewCases ?? this.localNewCases,
        localTotalCases: localTotalCases ?? this.localTotalCases,
        localTotalNumberOfIndividualsInHospitals:
            localTotalNumberOfIndividualsInHospitals ??
                this.localTotalNumberOfIndividualsInHospitals,
        localDeaths: localDeaths ?? this.localDeaths,
        localNewDeaths: localNewDeaths ?? this.localNewDeaths,
        localRecovered: localRecovered ?? this.localRecovered,
        localActiveCases: localActiveCases ?? this.localActiveCases,
        globalNewCases: globalNewCases ?? this.globalNewCases,
        globalTotalCases: globalTotalCases ?? this.globalTotalCases,
        globalDeaths: globalDeaths ?? this.globalDeaths,
        globalNewDeaths: globalNewDeaths ?? this.globalNewDeaths,
        globalRecovered: globalRecovered ?? this.globalRecovered,
        totalPcrTestingCount: totalPcrTestingCount ?? this.totalPcrTestingCount,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['update_date_time'] = updateDateTime;
    map['local_new_cases'] = localNewCases;
    map['local_total_cases'] = localTotalCases;
    map['local_total_number_of_individuals_in_hospitals'] =
        localTotalNumberOfIndividualsInHospitals;
    map['local_deaths'] = localDeaths;
    map['local_new_deaths'] = localNewDeaths;
    map['local_recovered'] = localRecovered;
    map['local_active_cases'] = localActiveCases;
    map['global_new_cases'] = globalNewCases;
    map['global_total_cases'] = globalTotalCases;
    map['global_deaths'] = globalDeaths;
    map['global_new_deaths'] = globalNewDeaths;
    map['global_recovered'] = globalRecovered;
    map['total_pcr_testing_count'] = totalPcrTestingCount;
    return map;
  }
}
