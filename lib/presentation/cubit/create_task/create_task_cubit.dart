import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:intl/intl.dart';
import 'package:meeting_task/presentation/cubit/get_data/get_data_cubit.dart';
import 'package:meeting_task/presentation/screens/mobile/home_screen.dart';
import 'package:meeting_task/repo/set_meetings_data_repository.dart';
import 'package:meeting_task/utils/constant.dart';
import 'package:meeting_task/utils/di.dart';
part 'create_task_state.dart';

class CreateTaskCubit extends Cubit<CreateTaskState> {
  CreateTaskCubit(this.createTask) : super(CreateTaskInitial());
  final CreateTaskRepo? createTask;

  DateTime date = DateTime.now();
  TimeOfDay time = TimeOfDay.now();
  TimeOfDay time1 = TimeOfDay.now();

  TextEditingController titleTaskControl = TextEditingController();
  TextEditingController descriptionControl = TextEditingController();

  TextEditingController dateControl = TextEditingController();
  TextEditingController startControl = TextEditingController();
  TextEditingController endControl = TextEditingController();
  String? dateFormat;
  setData(
      {required String monthName,
      required String date,
      required String title,
      required String description,
      required String meetingType,
      required String startTime,
      required String endTime,
      required String day,
        required int i,

      context}) {
    emit(LoadState());

    createTask!
        .setData(
      dayNum: dayNumber!,
      date: date,
      title: title,
      description: description,
      day: day,
      meetingType: meetingType,
      startTime: startTime,
      endTime: endTime,

    )
        .then((value) {

      print(day);
      print(monthName);
      print(dayNumber);

      print('success');
      di<GetDataCubit>().getData();

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
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
      dayNumber = DateFormat('d').format(date);
      dateControl.text = dateFormat!.toString();
      print(dateControl.text);
      emit(DateSuccessState());
    }).catchError((onError) {
      emit(DateExceptionState());
    });
  }

  getStartTimePicker(BuildContext context) async {
    TimeOfDay? newTime =
        await showTimePicker(context: context, initialTime: time1);
    if (newTime == null) return;
    time1 = newTime;
    startControl.text = time1.format(context).toString();
    emit(TimeSuccessState());
  }

  getEndTimePicker(BuildContext context) async {
    // emit(TimeLoadState());

    TimeOfDay? newTime =
        await showTimePicker(context: context, initialTime: time);
    if (newTime == null) return;
    time = newTime;
    endControl.text = time.format(context).toString();
    emit(TimeSuccessState());
  }

  String? categoryType;
  bool? states;

  String? name;
  bool? selectCategory(int newIndex) {
    for (int index = 0; index < isSelect.length; index++) {
      if (index == newIndex) {
        // isSelect[index] =true;
        isSelect[newIndex] = !isSelect[newIndex];
        print(isSelect[newIndex]);
        print(categoryList[newIndex]);
        categoryType = categoryList[newIndex];
        states = isSelect[newIndex];
        // } else {
        //   isSelect[newIndex] == false;
      }
      emit(SelectSuccessState());
    }
  }
}
