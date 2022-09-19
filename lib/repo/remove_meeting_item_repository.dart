import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meeting_task/presentation/cubit/get_data/get_data_cubit.dart';
import 'package:meeting_task/utils/di.dart';

abstract class RemoveMeetingItemRepository {
  Future<void> deleteMeeting(int i );
}

class RemoveMeetingImplement implements RemoveMeetingItemRepository {
  @override
  Future<void> deleteMeeting(int i )  {
    return FirebaseFirestore.instance.collection('Meeting').doc(di<GetDataCubit>().dataRepo.meetingData[i].id).delete().then((value) {
      print('ok');
    }).catchError((onError) {
      print('onerror : ${onError.toString()}');
    });
  }
}
