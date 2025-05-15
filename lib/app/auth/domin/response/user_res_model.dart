// To parse this JSON data, do
//
//     final userResModel = userResModelFromJson(jsonString);

import 'dart:convert';

UserResModel userResModelFromJson(String str) => UserResModel.fromJson(json.decode(str));

String userResModelToJson(UserResModel data) => json.encode(data.toJson());

class UserResModel {
  int? id;
  String? username;
  String? displayName;
  String? targetExam;
  String? examDate;
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

  UserResModel({
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

  factory UserResModel.fromJson(Map<String, dynamic> json) => UserResModel(
    id: json["id"],
    username: json["username"],
    displayName: json["displayName"],
    targetExam: json["targetExam"],
    examDate: json["examDate"],
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
    "examDate": examDate,
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
