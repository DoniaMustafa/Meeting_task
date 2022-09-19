part of 'remove_meeting_cubit.dart';

@immutable
abstract class RemoveMeetingState {}

class RemoveMeetingInitial extends RemoveMeetingState {}

class LoadingState extends RemoveMeetingState {}

class SuccessState extends RemoveMeetingState {}

class ErrorState extends RemoveMeetingState {}

class LoadState extends RemoveMeetingState {}
