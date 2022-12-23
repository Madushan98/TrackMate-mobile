/// vaccineType : "CoviSheild"
/// vaccineDoseNumber : 2342
/// vaccinatedDate : "2018-10-19T18:30:00Z"
/// vaccinatedPlace : "Colombo Hospital"

class VaccinationDetails {
  VaccinationDetails({
      this.vaccineType, 
      this.vaccineDoseNumber, 
      this.vaccinatedDate, 
      this.vaccinatedPlace,});

  VaccinationDetails.fromJson(dynamic json) {
    vaccineType = json['vaccineType'];
    vaccineDoseNumber = json['vaccineDoseNumber'];
    vaccinatedDate = json['vaccinatedDate'];
    vaccinatedPlace = json['vaccinatedPlace'];
  }
  String? vaccineType;
  int? vaccineDoseNumber;
  String? vaccinatedDate;
  String? vaccinatedPlace;
VaccinationDetails copyWith({  String? vaccineType,
  int? vaccineDoseNumber,
  String? vaccinatedDate,
  String? vaccinatedPlace,
}) => VaccinationDetails(  vaccineType: vaccineType ?? this.vaccineType,
  vaccineDoseNumber: vaccineDoseNumber ?? this.vaccineDoseNumber,
  vaccinatedDate: vaccinatedDate ?? this.vaccinatedDate,
  vaccinatedPlace: vaccinatedPlace ?? this.vaccinatedPlace,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['vaccineType'] = vaccineType;
    map['vaccineDoseNumber'] = vaccineDoseNumber;
    map['vaccinatedDate'] = vaccinatedDate;
    map['vaccinatedPlace'] = vaccinatedPlace;
    return map;
  }

}