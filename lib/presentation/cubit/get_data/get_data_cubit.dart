import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:intl/intl.dart';
import 'package:meeting_task/model.dart';
import 'package:meeting_task/repo/get_meetings_data_repository.dart';
import 'package:meeting_task/utils/constant.dart';
part 'get_data_state.dart';

class GetDataCubit extends Cubit<GetDataState> {
  GetDataCubit(this.dataRepo) : super(GetDataInitial());
  final DisplayDataRepo dataRepo;

  DateTime? selectedValue;
  Future<QueryDocumentSnapshot<Meeting>?> getData() async {
    emit(LoadState());
    return await dataRepo.getData().then((value) {
      print('success');
      emit(SuccessState(dataa: dataRepo.meetingData));
    }).catchError((onError) {
      print('Error : ${onError.toString()}');
      emit(ErrorState());
    });
}

  select(DateTime date){
    selectedValue = date;
   monthly= DateFormat('MMMM').format(date);
   daily= DateFormat('EEEE').format(date);
    dailies= DateFormat('d').format(date);

    print(dailies);
    print(monthly);
    print(daily);

    getData();
    emit(ErrorState());
  }
}
