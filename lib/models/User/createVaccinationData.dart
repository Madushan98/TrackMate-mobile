/// vaccineType : "pfizer"
/// userId : "11111111-1111-1111-1111-111111112213"
/// vaccineDoseNumber : 121313
/// vaccinatedDate : "2022-12-21T19:47:44.389Z"
/// vaccinatedPlace : "Rathnapura Hospital"

class CreateVaccinationData {
  CreateVaccinationData({
      this.vaccineType, 
      this.userId, 
      this.vaccineDoseNumber, 
      this.vaccinatedDate, 
      this.vaccinatedPlace,});

  CreateVaccinationData.fromJson(dynamic json) {
    vaccineType = json['vaccineType'];
    userId = json['userId'];
    vaccineDoseNumber = json['vaccineDoseNumber'];
    vaccinatedDate = json['vaccinatedDate'];
    vaccinatedPlace = json['vaccinatedPlace'];
  }
  String? vaccineType;
  String? userId;
  int? vaccineDoseNumber;
  String? vaccinatedDate;
  String? vaccinatedPlace;
CreateVaccinationData copyWith({  String? vaccineType,
  String? userId,
  int? vaccineDoseNumber,
  String? vaccinatedDate,
  String? vaccinatedPlace,
}) => CreateVaccinationData(  vaccineType: vaccineType ?? this.vaccineType,
  userId: userId ?? this.userId,
  vaccineDoseNumber: vaccineDoseNumber ?? this.vaccineDoseNumber,
  vaccinatedDate: vaccinatedDate ?? this.vaccinatedDate,
  vaccinatedPlace: vaccinatedPlace ?? this.vaccinatedPlace,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['vaccineType'] = vaccineType;
    map['userId'] = userId;
    map['vaccineDoseNumber'] = vaccineDoseNumber;
    map['vaccinatedDate'] = vaccinatedDate;
    map['vaccinatedPlace'] = vaccinatedPlace;
    return map;
  }

}