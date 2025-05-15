// To parse this JSON data, do
//
//     final loginReqModel = loginReqModelFromJson(jsonString);

import 'dart:convert';

LoginReqModel loginReqModelFromJson(String str) => LoginReqModel.fromJson(json.decode(str));

String loginReqModelToJson(LoginReqModel data) => json.encode(data.toJson());

class LoginReqModel {
  String? credential;
  String? password;

  LoginReqModel({
    this.credential,
    this.password,
  });

  factory LoginReqModel.fromJson(Map<String, dynamic> json) => LoginReqModel(
    credential: json["credential"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "credential": credential,
    "password": password,
  };
}
