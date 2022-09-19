import 'package:bloc/bloc.dart';
import 'package:meeting_task/repo/remove_meeting_item_repository.dart';
import 'package:meta/meta.dart';

import '../../../utils/di.dart';
import '../get_data/get_data_cubit.dart';

part 'remove_meeting_state.dart';

class RemoveMeetingCubit extends Cubit<RemoveMeetingState> {
  RemoveMeetingCubit({required this.removeItemRepo})
      : super(RemoveMeetingInitial());
  final RemoveMeetingItemRepository removeItemRepo;

  removeMeeting(int i) {
    // emit(LoadingState());
    removeItemRepo.deleteMeeting(i).then((value) {
      print('done');
      di<GetDataCubit>().dataRepo.meetingData.removeAt(i);
      print(i);
di<GetDataCubit>().getData();
      emit(SuccessState());
    }).catchError((error) {
      print('error : ${error.toString()}');
      emit(LoadState());
    });
  }
}
