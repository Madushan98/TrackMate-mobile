/// userId : "3fa85f64-5717-4562-b3fc-2c963f66afa6"
/// organizationId : "3fa85f64-5717-4562-b3fc-2c963f66afa6"
/// employeeNumber : 0
/// employeeContactNo : "string"

class UpdateOrganization {
  UpdateOrganization({
      this.userId, 
      this.organizationId, 
      this.employeeNumber, 
      this.employeeContactNo,});

  UpdateOrganization.fromJson(dynamic json) {
    userId = json['userId'];
    organizationId = json['organizationId'];
    employeeNumber = json['employeeNumber'];
    employeeContactNo = json['employeeContactNo'];
  }
  String? userId;
  String? organizationId;
  int? employeeNumber;
  String? employeeContactNo;
UpdateOrganization copyWith({  String? userId,
  String? organizationId,
  int? employeeNumber,
  String? employeeContactNo,
}) => UpdateOrganization(  userId: userId ?? this.userId,
  organizationId: organizationId ?? this.organizationId,
  employeeNumber: employeeNumber ?? this.employeeNumber,
  employeeContactNo: employeeContactNo ?? this.employeeContactNo,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userId'] = userId;
    map['organizationId'] = organizationId;
    map['employeeNumber'] = employeeNumber;
    map['employeeContactNo'] = employeeContactNo;
    return map;
  }

}