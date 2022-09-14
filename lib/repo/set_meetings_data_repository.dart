import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meeting_task/utils/constant.dart';

abstract class CreateTaskRepo {
  Future<void> setData({
    required String date,
    required String title,
    required String description,
    required String startTime,
    required String endTime,
    required String day,
    required String dayNum,

  });
}

class CreateTaskImp implements CreateTaskRepo {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<void> setData({
    required String date,
    required String title,
    required String description,
    // required String meetingType,
    required String startTime,
    required String endTime,
    required String day,
    required String dayNum,

  }) async {
    // return await meeting.add({'month': monthName}).then((value) {
    //
    //       value.collection('days').add({'day': dayName}).then((value1) {
    //         value1.collection('data').add({
    //       'title': title,
    //       'description': description,
    //       'date': date,
    //       'startTime': startTime,
    //       'endTime': endTime,
    //     });
    //   }).catchError((error) {
    //     print('error ${error.toString()}');
    //   });
    // }).catchError((lastError) {
    //   print('lastError ${lastError.toString()}');
    // });

    // .then((value) {

    // }).catchError((error) => print("Failed to merge data: $error"));
    return await meeting
        .doc()
        .set({
          'title': title,
          'description': description,
          'date': date,
          'startTime': startTime,
          'endTime': endTime,
          'month': monthName,
          'day': dayName,
      'dayNumber':dayNumber
        })
        .then((value) {})
        .catchError((onError) {});
  }
}
