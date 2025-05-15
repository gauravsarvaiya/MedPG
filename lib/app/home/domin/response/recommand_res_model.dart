// To parse this JSON data, do
//
//     final recommendationResModel = recommendationResModelFromJson(jsonString);

import 'dart:convert';

List<RecommendationResModel> recommendationResModelFromJson(String str) => List<RecommendationResModel>.from(json.decode(str).map((x) => RecommendationResModel.fromJson(x)));

String recommendationResModelToJson(List<RecommendationResModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

List<RecommendationResModel> recommendationResModelFromJsonDynamic(List<dynamic> list) =>
    List<RecommendationResModel>.from(list.map((x) => RecommendationResModel.fromJson(x)));



class RecommendationResModel {
  String? subject;
  String? topic;
  dynamic subtopic;
  int? accuracy;
  String? reason;
  int? priority;

  RecommendationResModel({
    this.subject,
    this.topic,
    this.subtopic,
    this.accuracy,
    this.reason,
    this.priority,
  });

  factory RecommendationResModel.fromJson(Map<String, dynamic> json) => RecommendationResModel(
    subject: json["subject"],
    topic: json["topic"],
    subtopic: json["subtopic"],
    accuracy: json["accuracy"],
    reason: json["reason"],
    priority: json["priority"],
  );

  Map<String, dynamic> toJson() => {
    "subject": subject,
    "topic": topic,
    "subtopic": subtopic,
    "accuracy": accuracy,
    "reason": reason,
    "priority": priority,
  };
}
