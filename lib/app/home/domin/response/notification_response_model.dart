// To parse this JSON data, do
//
//     final notificationResModel = notificationResModelFromJson(jsonString);

import 'dart:convert';

List<NotificationResModel> notificationResModelFromJson(String str) => List<NotificationResModel>.from(json.decode(str).map((x) => NotificationResModel.fromJson(x)));

String notificationResModelToJson(List<NotificationResModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

List<NotificationResModel> notificationResModelFromJsonDynamic(List<dynamic> list) =>
    List<NotificationResModel>.from(list.map((x) => NotificationResModel.fromJson(x)));


class NotificationResModel {
  int? id;
  int? userId;
  String? title;
  String? message;
  Type? type;
  bool? isRead;
  DateTime? createdAt;
  LinkUrl? linkUrl;
  // dynamic metadata;

  NotificationResModel({
    this.id,
    this.userId,
    this.title,
    this.message,
    this.type,
    this.isRead,
    this.createdAt,
    this.linkUrl,
    // this.metadata,
  });

  factory NotificationResModel.fromJson(Map<String, dynamic> json) => NotificationResModel(
    id: json["id"],
    userId: json["userId"],
    title: json["title"],
    message: json["message"],
    type: typeValues.map[json["type"]]!,
    isRead: json["isRead"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    linkUrl: linkUrlValues.map[json["linkUrl"]]!,
    // metadata: json["metadata"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "userId": userId,
    "title": titleValues.reverse[title],
    "message": message,
    "type": typeValues.reverse[type],
    "isRead": isRead,
    "createdAt": createdAt?.toIso8601String(),
    "linkUrl": linkUrlValues.reverse[linkUrl],
    // "metadata": metadata,
  };
}

enum LinkUrl {
  PRACTICE,
  PRACTICE_RESULT_32,
  PRACTICE_RESULT_33,
  PRACTICE_RESULT_812,
  PROGRESS,
  THEMEDICO_APP_PRACTICE,
  VERIFY_EMAIL
}

final linkUrlValues = EnumValues({
  "/practice": LinkUrl.PRACTICE,
  "/practice/result/32": LinkUrl.PRACTICE_RESULT_32,
  "/practice/result/33": LinkUrl.PRACTICE_RESULT_33,
  "/practice/result/812": LinkUrl.PRACTICE_RESULT_812,
  "/progress": LinkUrl.PROGRESS,
  "themedico.app/practice": LinkUrl.THEMEDICO_APP_PRACTICE,
  "/verify-email": LinkUrl.VERIFY_EMAIL
});

enum Title {
  FIRST_SESSION_COMPLETED,
  PLEASE_VERIFY_YOUR_EMAIL,
  SPEED_DEMON,
  TEST,
  THE_5_SESSIONS_MILESTONE
}

final titleValues = EnumValues({
  "First Session Completed!": Title.FIRST_SESSION_COMPLETED,
  "Please Verify Your Email": Title.PLEASE_VERIFY_YOUR_EMAIL,
  "Speed Demon!": Title.SPEED_DEMON,
  "Test": Title.TEST,
  "5 Sessions Milestone!": Title.THE_5_SESSIONS_MILESTONE
});

enum Type {
  ACHIEVEMENT,
  PRACTICE_REMINDER,
  SYSTEM_UPDATE
}

final typeValues = EnumValues({
  "achievement": Type.ACHIEVEMENT,
  "practice_reminder": Type.PRACTICE_REMINDER,
  "system_update": Type.SYSTEM_UPDATE
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
