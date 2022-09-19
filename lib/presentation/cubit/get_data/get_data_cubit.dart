import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meeting_task/model.dart';
import 'package:meeting_task/repo/get_meetings_data_repository.dart';
import 'package:meeting_task/utils/constant.dart';
import 'package:meeting_task/utils/date_time.dart';
part 'get_data_state.dart';

class GetDataCubit extends Cubit<GetDataState> {
  GetDataCubit(this.dataRepo) : super(GetDataInitial());
  final DisplayDataRepo dataRepo;
  ScrollController? scrollController;
  List<DateTime> currentMonthDateList = List.empty();
  DateTime currentDateTime = DateTime.now();
  DateTime? selectedValue;
  Future<QueryDocumentSnapshot<Meeting>?> getData() async {
    emit(LoadState());
    return await dataRepo.getData().then((value) {

      emit(SuccessState(dataa: dataRepo.meetingData));

    }).catchError((onError) {
      emit(ErrorState());
    });
  }
  List<DateTime> listDate = [];
  String? date;

  int? getDate() {
    currentMonthDateList = DateTimeUtils.daysInMonth(currentDateTime);
    currentMonthDateList.sort((a, b) => a.day.compareTo(b.day));
    currentMonthDateList = currentMonthDateList.toSet().toList();
    currentMonthDateList.forEach((element) {
      if(element.day >= DateTime.now().day){
        listDate.add(element);
      }
    });

    scrollController =
        ScrollController(initialScrollOffset: 70.0 * currentDateTime.day);
    date= DateFormat('EEEE,d MMMM').format(DateTime.now());
    print(date);
    print('month : ${currentMonthDateList.length}');
    emit(GetDateState());
  }

  // @override
  // Future<void> setUid(String uid) async {
  //   emit(LoadState());
  //
  //   return await meeting
  //       .doc()
  //       .set({'uid': uid})
  //       .then((value) {
  //     emit(ErrorState());
  //       })
  //       .catchError((onError) {
  //     emit(GetDateState());
  //
  //   });
  // }

//
  DateTime? getSelect(int index) {
    currentDateTime = listDate[index];

    monthly = DateFormat('MMMM').format(currentDateTime);
    daily = DateFormat('EEEE').format(currentDateTime);
    dailies = DateFormat('d').format(currentDateTime);
    print(currentMonthDateList[index].day == currentDateTime.day);
    print(currentDateTime.day);
    // select(currentDateTime);
    getData();
    emit(LoadState());
  }

}
