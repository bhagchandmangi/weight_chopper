// To parse this JSON data, do
//
//     final userDataModel = userDataModelFromJson(jsonString);

import 'dart:convert';

UserDataModel userDataModelFromJson(String str) =>
    UserDataModel.fromJson(json.decode(str));

String userDataModelToJson(UserDataModel data) => json.encode(data.toJson());

class UserDataModel {
  UserDataModel({
    this.name,
    this.password,
    this.user,
    this.keyToken,
    this.message,
    this.responseDto,
  });

  String? name;
  dynamic password;
  User? user;
  String? keyToken;
  dynamic message;
  ResponseDto? responseDto;

  factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
        name: json["Name"],
        password: json["Password"],
        user: User.fromJson(json["user"]),
        keyToken: json["keyToken"],
        message: json["Message"],
        responseDto: ResponseDto.fromJson(json["responseDto"]),
      );

  Map<String, dynamic> toJson() => {
        "Name": name,
        "Password": password,
        "user": user!.toJson(),
        "keyToken": keyToken,
        "Message": message,
        "responseDto": responseDto!.toJson(),
      };
}

class ResponseDto {
  ResponseDto({
    this.status,
    this.message,
    this.exception,
  });

  bool? status;
  String? message;
  dynamic? exception;

  factory ResponseDto.fromJson(Map<String, dynamic> json) => ResponseDto(
        status: json["Status"],
        message: json["Message"],
        exception: json["Exception"],
      );

  Map<String, dynamic> toJson() => {
        "Status": status,
        "Message": message,
        "Exception": exception,
      };
}

class User {
  User({
    this.id,
    this.userName,
    this.email,
    this.password,
    this.otp,
    this.isConfirmed,
    this.createdAt,
    this.modifiedAt,
  });

  int? id;
  String? userName;
  String? email;
  String? password;
  bool? otp;
  bool? isConfirmed;
  DateTime? createdAt;
  dynamic modifiedAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["Id"],
        userName: json["UserName"],
        email: json["Email"],
        password: json["Password"],
        otp: json["OTP"],
        isConfirmed: json["IsConfirmed"],
        createdAt: DateTime.parse(json["CreatedAt"]),
        modifiedAt: json["ModifiedAt"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "UserName": userName,
        "Email": email,
        "Password": password,
        "OTP": otp,
        "IsConfirmed": isConfirmed,
        "CreatedAt": createdAt!.toIso8601String(),
        "ModifiedAt": modifiedAt,
      };
}
