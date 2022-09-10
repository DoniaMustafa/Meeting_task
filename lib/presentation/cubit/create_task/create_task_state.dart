part of 'create_task_cubit.dart';

@immutable
abstract class CreateTaskState {}

class CreateTaskInitial extends CreateTaskState {}
class LoadState extends CreateTaskState {}
class SuccessState extends CreateTaskState {}
class ExceptionState extends CreateTaskState {}
class DateLoadState extends CreateTaskState {}
class DateExceptionState extends CreateTaskState {}
class DateSuccessState extends CreateTaskState {}
class TimeSuccessState extends CreateTaskState {}
class TimeLoadState extends CreateTaskState {}
class TimeExceptionState extends CreateTaskState {}
class SelectSuccessState extends CreateTaskState {}
