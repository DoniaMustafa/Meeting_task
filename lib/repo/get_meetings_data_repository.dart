import 'dart:convert';

import 'package:meeting_task/model.dart';
import 'package:meeting_task/utils/constant.dart';

abstract class DisplayDataRepo {
  Future getData();
}

class DisplayDataImplement implements DisplayDataRepo {
  @override
  Future getData() async {
    return await meeting
        .doc()
        .collection(monthName!)
        .doc()
        .collection(dayName!)
        .doc()
        .collection("meetingData")
        .doc()
        .snapshots()
        .listen((event) {
      MeetingsData data = MeetingsData.fromJson(json.decode(event.data().toString()));

      print('rr : ${data}');
    });
  }
}
