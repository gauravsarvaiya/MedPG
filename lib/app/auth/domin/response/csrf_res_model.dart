// To parse this JSON data, do
//
//     final csrfResModel = csrfResModelFromJson(jsonString);

import 'dart:convert';

CsrfResModel csrfResModelFromJson(String str) => CsrfResModel.fromJson(json.decode(str));

String csrfResModelToJson(CsrfResModel data) => json.encode(data.toJson());

class CsrfResModel {
  String? csrfToken;
  int? expiresAt;

  CsrfResModel({
    this.csrfToken,
    this.expiresAt,
  });

  factory CsrfResModel.fromJson(Map<String, dynamic> json) => CsrfResModel(
    csrfToken: json["csrfToken"],
    expiresAt: json["expiresAt"],
  );

  Map<String, dynamic> toJson() => {
    "csrfToken": csrfToken,
    "expiresAt": expiresAt,
  };
}
