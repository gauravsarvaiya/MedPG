// To parse this JSON data, do
//
//     final loginResModel = loginResModelFromJson(jsonString);

import 'dart:convert';

LoginResModel loginResModelFromJson(String str) => LoginResModel.fromJson(json.decode(str));

String loginResModelToJson(LoginResModel data) => json.encode(data.toJson());

class LoginResModel {
  String? message;
  User? user;

  LoginResModel({
    this.message,
    this.user,
  });

  factory LoginResModel.fromJson(Map<String, dynamic> json) => LoginResModel(
    message: json["message"],
    user: json["user"] == null ? null : User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "user": user?.toJson(),
  };
}

class User {
  int? id;
  String? username;
  String? displayName;
  String? targetExam;
  DateTime? examDate;
  DateTime? memberSince;
  String? role;
  String? email;
  dynamic phoneNumber;
  bool? emailVerified;
  bool? isActive;
  DateTime? lastLogin;
  String? examYear;
  String? dreamRank;
  int? weeklyTargetQuestions;
  int? weeklyTargetRevisionHours;
  int? weeklyTargetStudyHours;
  dynamic accuracyTarget;
  dynamic percentileTarget;
  bool? onboardingCompleted;
  bool? baselineAssessmentCompleted;

  User({
    this.id,
    this.username,
    this.displayName,
    this.targetExam,
    this.examDate,
    this.memberSince,
    this.role,
    this.email,
    this.phoneNumber,
    this.emailVerified,
    this.isActive,
    this.lastLogin,
    this.examYear,
    this.dreamRank,
    this.weeklyTargetQuestions,
    this.weeklyTargetRevisionHours,
    this.weeklyTargetStudyHours,
    this.accuracyTarget,
    this.percentileTarget,
    this.onboardingCompleted,
    this.baselineAssessmentCompleted,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    username: json["username"],
    displayName: json["displayName"],
    targetExam: json["targetExam"],
    examDate: json["examDate"] == null ? null : DateTime.parse(json["examDate"]),
    memberSince: json["memberSince"] == null ? null : DateTime.parse(json["memberSince"]),
    role: json["role"],
    email: json["email"],
    phoneNumber: json["phoneNumber"],
    emailVerified: json["emailVerified"],
    isActive: json["isActive"],
    lastLogin: json["lastLogin"] == null ? null : DateTime.parse(json["lastLogin"]),
    examYear: json["examYear"],
    dreamRank: json["dreamRank"],
    weeklyTargetQuestions: json["weeklyTargetQuestions"],
    weeklyTargetRevisionHours: json["weeklyTargetRevisionHours"],
    weeklyTargetStudyHours: json["weeklyTargetStudyHours"],
    accuracyTarget: json["accuracyTarget"],
    percentileTarget: json["percentileTarget"],
    onboardingCompleted: json["onboardingCompleted"],
    baselineAssessmentCompleted: json["baselineAssessmentCompleted"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "displayName": displayName,
    "targetExam": targetExam,
    "examDate": "${examDate!.year.toString().padLeft(4, '0')}-${examDate!.month.toString().padLeft(2, '0')}-${examDate!.day.toString().padLeft(2, '0')}",
    "memberSince": memberSince?.toIso8601String(),
    "role": role,
    "email": email,
    "phoneNumber": phoneNumber,
    "emailVerified": emailVerified,
    "isActive": isActive,
    "lastLogin": lastLogin?.toIso8601String(),
    "examYear": examYear,
    "dreamRank": dreamRank,
    "weeklyTargetQuestions": weeklyTargetQuestions,
    "weeklyTargetRevisionHours": weeklyTargetRevisionHours,
    "weeklyTargetStudyHours": weeklyTargetStudyHours,
    "accuracyTarget": accuracyTarget,
    "percentileTarget": percentileTarget,
    "onboardingCompleted": onboardingCompleted,
    "baselineAssessmentCompleted": baselineAssessmentCompleted,
  };
}
