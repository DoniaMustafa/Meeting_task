import 'dart:convert';

MeetingsData meetingsDataFromJson(String str) => MeetingsData.fromJson(json.decode(str));

String meetingsDataToJson(MeetingsData data) => json.encode(data.toJson());

class MeetingsData {
  MeetingsData({
    this.date,
    this.description,
    this.endTime,
    this.startTime,
    this.title,
  });

  final String? date;
  final String? description;
  final String? endTime;
  final String? startTime;
  final String? title;

  factory MeetingsData.fromJson(Map<String, dynamic> json) => MeetingsData(
    date: json["date"],
    description: json["description"],
    endTime: json["endTime"],
    startTime: json["startTime"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "date": date,
    "description": description,
    "endTime": endTime,
    "startTime": startTime,
    "title": title,
  };
}

// class MeetingsData {
//   final String? title;
//   final String? date;
//   final String? startTime;
//   final String? endTime;
//   final String? description;
//
//   MeetingsData(
//       {required this.endTime,
//       required this.title,
//       required this.date,
//       required this.startTime,
//       required this.description});
//
//   factory MeetingsData.fromJson(Map<String, dynamic> json) => MeetingsData(
//       endTime: json["endTime"],
//       title: json["title"],
//       date: json["date"],
//       startTime: json["startTime"],
//       description: json["description"]);
//
//   Map<String, dynamic> toJson() => {
//        "title": title,
//         "date": date,
//         "startTime": startTime,
//         "description": description,
//         "endTime": endTime,
//       };
// }
