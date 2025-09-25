// To parse this JSON data, do
//
//     final userLoginPostRequest = userLoginPostRequestFromJson(jsonString);

import 'dart:convert';

UserLoginPostRequest userLoginPostRequestFromJson(String str) =>
    UserLoginPostRequest.fromJson(json.decode(str));

String userLoginPostRequestToJson(UserLoginPostRequest data) =>
    json.encode(data.toJson());

class UserLoginPostRequest {
  String phoneNumber;
  String password;

  UserLoginPostRequest({required this.phoneNumber, required this.password});

  factory UserLoginPostRequest.fromJson(Map<String, dynamic> json) =>
      UserLoginPostRequest(
        phoneNumber: json["phoneNumber"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
    "phoneNumber": phoneNumber,
    "password": password,
  };
}
