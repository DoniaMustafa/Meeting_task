
class Meeting {
  final String title;
  final String date;
  final String startTime;
  final String endTime;
  final String description;
  final String day;
  final String month;

  Meeting(
      {required this.title,
        required this.date,
        required this.startTime,
        required this.endTime,
        required this.description,
        required this.day,
        required this.month});

  factory Meeting.fromJson(Map<String, dynamic> json) => Meeting(
    date: json["date"],
    title: json["title"],
    description: json["description"],
    endTime: json["endTime"],
    startTime: json["startTime"],
    day: json["day"],
    month: json["month"],
  );

  Map<String, dynamic> toJson() => {
    "date": date,
    "title": title,
    "description": description,
    "endTime": endTime,
    "startTime": startTime,
    "month": month,
    "day": day
  };
}
