/// nationalId : "string"
/// password : "string"

class LoginModel {
  LoginModel({
      required this.nationalId,
      required this.password,});

  String nationalId;
  String password;
LoginModel copyWith({  String? nationalId,
  String? password,
}) => LoginModel(  nationalId: nationalId ?? this.nationalId,
  password: password ?? this.password,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['nationalId'] = nationalId;
    map['password'] = password;
    return map;
  }

}