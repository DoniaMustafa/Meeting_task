import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meeting_task/model.dart';
import 'package:meeting_task/utils/constant.dart';

abstract class DisplayDataRepo {
  List<QueryDocumentSnapshot<Meeting>> meetingData = [];
  CollectionReference handelData();
  Future<QuerySnapshot<Meeting>?> getData();
}

class DisplayDataImplement implements DisplayDataRepo {
  @override
  List<QueryDocumentSnapshot<Meeting>> meetingData = [];

  @override
  CollectionReference<Meeting> handelData() =>
      FirebaseFirestore.instance.collection('Meeting').withConverter<Meeting>(
            fromFirestore: (snapshot, _) => Meeting.fromJson(snapshot.data()!),
            toFirestore: (meeting, _) => meeting.toJson(),
          );

  @override
  Future<QuerySnapshot<Meeting>?> getData() async {
    return await handelData()
        .where('month', isEqualTo: monthly)
        .where('day', isEqualTo: daily)
        .where('dayNumber', isEqualTo: dailies)
        .get()
        .then((event) {
      meetingData = event.docs;

    }).catchError((onError) {
      print(onError.toString());
    });
  }
}
