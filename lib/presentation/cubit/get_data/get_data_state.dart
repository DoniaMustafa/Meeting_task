part of 'get_data_cubit.dart';

abstract class GetDataState {}

class GetDataInitial extends GetDataState {}
class LoadState extends GetDataState {}
class SuccessState extends GetDataState {}
class ErrorState extends GetDataState {}
