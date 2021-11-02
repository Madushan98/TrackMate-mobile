
import 'dart:convert';

User welcomeFromJson(String str) => User.fromJson(json.decode(str));

String welcomeToJson(User data) => json.encode(data.toJson());

class User {
  User({
     this.createdAt,
     this.fullName,
     this.nationalId,
     this.userName,
     this.password,
  });

  int?createdAt;
  String?fullName;
  int?nationalId;
  String?userName;
  String?password;

  factory User.fromJson(Map<String, dynamic> json) => User(
    createdAt: json["createdAt"],
    fullName: json["fullName"],
    nationalId: json["nationalId"],
    userName: json["userName"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "createdAt": createdAt,
    "fullName": fullName,
    "nationalId": nationalId,
    "userName": userName,
    "password": password,
  };
}
