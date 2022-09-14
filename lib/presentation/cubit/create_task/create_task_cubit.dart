import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:intl/intl.dart';
import 'package:meeting_task/repo/set_meetings_data_repository.dart';
import 'package:meeting_task/utils/constant.dart';
part 'create_task_state.dart';

class CreateTaskCubit extends Cubit<CreateTaskState> {
  CreateTaskCubit(this.createTask) : super(CreateTaskInitial());
  final CreateTaskRepo? createTask;

  DateTime date = DateTime.now();
  TimeOfDay time = TimeOfDay.now();
  TextEditingController titleTaskControl = TextEditingController();
  TextEditingController descriptionControl = TextEditingController();

  TextEditingController dateControl = TextEditingController();
  TextEditingController startControl = TextEditingController();
  TextEditingController endControl = TextEditingController();
  String? dateFormat;
  // String? monthName;
  setData({
    required String monthName,
    required String date,

    required String title,
    required String description,
    // required String meetingType,
    required String startTime,
    required String endTime,
    required String day,
  }) {
    emit(LoadState());

    createTask!
        .setData(
 dayNum:dayNumber!,

      date:date ,
      title: title,
      description: description,
      day: day,
      startTime: startTime,
      endTime: endTime,
    )
        .then((value) {
      print(day);
      print(monthName);
      print(dayNumber);

      print('success');


      emit(SuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(ExceptionState());
    });
  }

  Future getDatePicker(context) async {
    emit(DateLoadState());
    await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(1990),
      lastDate: DateTime(2030),
    ).then((value) {
      DateTime? newDate = value;
      if (newDate == null) return;
      date = newDate;
      dateFormat = DateFormat('EEEE, d MMMM').format(date);
    monthName = DateFormat('MMMM').format(date);
      dayName = DateFormat('EEEE').format(date);
      dayNumber= DateFormat('d').format(date);
      dateControl.text = dateFormat!.toString();
      print(dayNumber);
      emit(DateSuccessState());
    }).catchError((onError) {
      emit(DateExceptionState());
    });
  }

  Future getStartTimePicker(context) async {
    TimeOfDay? newTime =
        await showTimePicker(context: context, initialTime: time);
    if (newTime == null) return;
    time = newTime;
    startControl.text = time.format(context);
    emit(TimeSuccessState());
  }

  Future getEndTimePicker(context) async {
    emit(TimeLoadState());

    await showTimePicker(context: context, initialTime: time).then((value) {
      TimeOfDay? newTime = value;
      if (newTime == null) return;
      time = newTime;
      endControl.text = time.format(context).toString();
      emit(TimeSuccessState());
    }).catchError((re) {
      emit(TimeExceptionState());
    });
  }
String? name;
  selectCategory(int newIndex) {
    for (int index = 0; index < isSelect.length; index++) {
      if (index == newIndex) {
        isSelect[index] =  true ;
        print(categoryList[newIndex]);
      } else {
        isSelect[index] == false;

      }
    //   if(isSelect[newIndex] = false){
    //     print(categoryList[newIndex]);
    // }
      emit(SelectSuccessState());
    }
    // categoryList[newIndex]==isSelect[newIndex];
    // name=categoryList[newIndex];
    // print(categoryList[newIndex]);

  }
}
