// To parse this JSON data, do
//
//     final userLoginPostResponse = userLoginPostResponseFromJson(jsonString);

import 'dart:convert';

UserLoginPostResponse userLoginPostResponseFromJson(String str) => UserLoginPostResponse.fromJson(json.decode(str));

String userLoginPostResponseToJson(UserLoginPostResponse data) => json.encode(data.toJson());

class UserLoginPostResponse {
    String message;
    User user;

    UserLoginPostResponse({
        required this.message,
        required this.user,
    });

    factory UserLoginPostResponse.fromJson(Map<String, dynamic> json) => UserLoginPostResponse(
        message: json["message"],
        user: User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "user": user.toJson(),
    };
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
