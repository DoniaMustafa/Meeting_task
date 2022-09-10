import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meeting_task/utils/constant.dart';

abstract class CreateTaskRepo {
  Future<void> setData({
    required String monthName,
    required String date,
    required String title,
    required String description,
    // required String meetingType,
    required String startTime,
    required String endTime,
    required String day,
  });
}

class CreateTaskImp implements CreateTaskRepo {
  FirebaseFirestore firestore = FirebaseFirestore.instance;


  @override
  Future<void> setData({
    required String date,
    required String monthName,
    required String title,
    required String description,
    // required String meetingType,
    required String startTime,
    required String endTime,
    required String day,
  }) async {
    return await meeting.doc().collection(monthName).doc().collection(dayName!).doc().collection("meetingData")
        .add({
      "title": title,
      "description": description,
      "date":date,
      // 'meetingType': meetingType,
      "startTime": startTime,
      "endTime": endTime,
      // 'department': department,
    }).then((value) {
     print(value.id);

    }).catchError((error) => print("Failed to merge data: $error"));
  }
}
