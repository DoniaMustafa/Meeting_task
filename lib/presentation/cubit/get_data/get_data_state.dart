part of 'get_data_cubit.dart';

abstract class GetDataState {
 // final List <QueryDocumentSnapshot<Meeting>> data=[];

}

class GetDataInitial extends GetDataState {
}
class LoadState extends GetDataState {}
class SuccessState extends GetDataState{
  List <QueryDocumentSnapshot<Meeting>>dataa=[];


  SuccessState({required this.dataa});
}
class ErrorState extends GetDataState {}
class GetDateState extends GetDataState {}
