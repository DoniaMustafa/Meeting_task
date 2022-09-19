
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
    required String meetingType,
  });

  // Future<void> setUid(String uid);
}

class CreateTaskImp implements CreateTaskRepo {
  @override
  @override
  Future<void> setData({
    required String date,
    required String title,
    required String description,
    required String meetingType,
    required String startTime,
    required String endTime,
    required String day,
    required String dayNum,
  }) async {
    return await meeting.doc().set({
      'title': title,
      'description': description,
      'date': date,
      'startTime': startTime,
      'endTime': endTime,
      'month': monthName,
      'day': dayName,
      'dayNumber': dayNumber,
      'meetingType': meetingType,
    }).then((value) {
// print('uid : $uid');
//             print('i : $i');
      }).catchError((onError) {
      print('error : ${onError.toString()}');

    });
    }


}
