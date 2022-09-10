import 'package:bloc/bloc.dart';
import 'package:meeting_task/repo/get_meetings_data_repository.dart';
part 'get_data_state.dart';

class GetDataCubit extends Cubit<GetDataState> {
  GetDataCubit(this.dataRepo) : super(GetDataInitial());
  final DisplayDataRepo dataRepo;

  Future getData() async {
    emit(LoadState());
   return await dataRepo
        .getData()
        .then((value) {
          print('success');
          emit(SuccessState());
        }).catchError((onError) {
      print('Error : ${onError.toString()}');
      emit(ErrorState());
    });
  }
}
