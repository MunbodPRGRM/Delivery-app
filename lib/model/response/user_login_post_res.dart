// To parse this JSON data, do
//
//     final userLoginPostRequest = userLoginPostRequestFromJson(jsonString);

import 'dart:convert';

UserLoginPostRequest userLoginPostRequestFromJson(String str) =>
    UserLoginPostRequest.fromJson(json.decode(str));

String userLoginPostRequestToJson(UserLoginPostRequest data) =>
    json.encode(data.toJson());

class UserLoginPostRequest {
  String message;
  User user;

  UserLoginPostRequest({required this.message, required this.user});

  factory UserLoginPostRequest.fromJson(Map<String, dynamic> json) =>
      UserLoginPostRequest(
        message: json["message"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {"message": message, "user": user.toJson()};
}

class User {
  int userId;
  String phoneNumber;
  String password;
  String name;
  dynamic picProfile;
  dynamic gps;

  User({
    required this.userId,
    required this.phoneNumber,
    required this.password,
    required this.name,
    required this.picProfile,
    required this.gps,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    userId: json["userId"],
    phoneNumber: json["phoneNumber"],
    password: json["password"],
    name: json["name"],
    picProfile: json["picProfile"],
    gps: json["gps"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "phoneNumber": phoneNumber,
    "password": password,
    "name": name,
    "picProfile": picProfile,
    "gps": gps,
  };
}
