// To parse this JSON data, do
//
//     final activityModel = activityModelFromJson(jsonString);

import 'dart:convert';

ActivityModel activityModelFromJson(String str) => ActivityModel.fromJson(json.decode(str));

String activityModelToJson(ActivityModel data) => json.encode(data.toJson());

class ActivityModel {
    ActivityModel({
        this.activity,
        this.type,
        this.participants,
        this.price,
        this.link,
        this.key,
        this.accessibility,
    });

    String? activity;
    String? type;
    int? participants;
    double? price;
    String? link;
    String? key;
    double? accessibility;

    factory ActivityModel.fromJson(Map<String, dynamic> json) => ActivityModel(
        activity: json["activity"] == null ? null : json["activity"],
        type: json["type"] == null ? null : json["type"],
        participants: json["participants"] == null ? null : json["participants"],
        price: json["price"] == null ? null : json["price"].toDouble(),
        link: json["link"] == null ? null : json["link"],
        key: json["key"] == null ? null : json["key"],
        accessibility: json["accessibility"] == null ? null : json["accessibility"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "activity": activity == null ? null : activity,
        "type": type == null ? null : type,
        "participants": participants == null ? null : participants,
        "price": price == null ? null : price,
        "link": link == null ? null : link,
        "key": key == null ? null : key,
        "accessibility": accessibility == null ? null : accessibility,
    };
}
