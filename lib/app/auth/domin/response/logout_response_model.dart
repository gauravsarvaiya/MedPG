// To parse this JSON data, do
//
//     final logoutResModel = logoutResModelFromJson(jsonString);

import 'dart:convert';

LogoutResModel logoutResModelFromJson(String str) => LogoutResModel.fromJson(json.decode(str));

String logoutResModelToJson(LogoutResModel data) => json.encode(data.toJson());

class LogoutResModel {
  String? message;
  bool? success;

  LogoutResModel({
    this.message,
    this.success,
  });

  factory LogoutResModel.fromJson(Map<String, dynamic> json) => LogoutResModel(
    message: json["message"],
    success: json["success"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "success": success,
  };
}
