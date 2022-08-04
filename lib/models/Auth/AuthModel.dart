import '../User/UserModel.dart';

/// nationalId : null
/// id : "11111111-1111-1111-1111-111111111111"
/// token : ""
/// refreshToken : "8f1aad45-44c5-4691-b248-fdb2e96a2b00"
/// user : {"userId":"11111111-1111-1111-1111-111111111111","nationalId":"982351123V","firstName":"Admin","lastName":"Admin","birthDate":"0001-01-01T00:00:00","primaryContactNumber":null,"town":null,"district":null,"isVertified":true,"permissions":null,"roles":null}

class AuthModel {
  AuthModel({
    this.nationalId,
    this.id,
    this.token,
    this.refreshToken,
    this.user,
  });

  AuthModel.fromJson(dynamic json) {
    nationalId = json['nationalId'];
    id = json['id'];
    token = json['token'];
    refreshToken = json['refreshToken'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  String? nationalId;
  String? id;
  String? token;
  String? refreshToken;
  User? user;
  AuthModel copyWith({
    String? nationalId,
    String? id,
    String? token,
    String? refreshToken,
    User? user,
  }) =>
      AuthModel(
        nationalId: nationalId ?? this.nationalId,
        id: id ?? this.id,
        token: token ?? this.token,
        refreshToken: refreshToken ?? this.refreshToken,
        user: user ?? this.user,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['nationalId'] = nationalId;
    map['id'] = id;
    map['token'] = token;
    map['refreshToken'] = refreshToken;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    return map;
  }
}
