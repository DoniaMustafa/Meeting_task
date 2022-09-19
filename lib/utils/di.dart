import 'package:get_it/get_it.dart';
import 'package:meeting_task/presentation/cubit/create_task/create_task_cubit.dart';
import 'package:meeting_task/presentation/cubit/get_data/get_data_cubit.dart';
import 'package:meeting_task/presentation/cubit/remove_meeting/remove_meeting_cubit.dart';
import 'package:meeting_task/repo/get_meetings_data_repository.dart';
import 'package:meeting_task/repo/remove_meeting_item_repository.dart';
import 'package:meeting_task/repo/set_meetings_data_repository.dart';

GetIt di = GetIt.I..allowReassignment = true;
Future<void> initializeDependency() async {
  di.registerLazySingleton<CreateTaskRepo>( () => CreateTaskImp());
  di.registerLazySingleton<CreateTaskCubit>(() => CreateTaskCubit(di<CreateTaskRepo>()));
  di.registerLazySingleton<DisplayDataRepo>(() => DisplayDataImplement());
  di.registerLazySingleton<GetDataCubit>(() =>GetDataCubit(di<DisplayDataRepo>()));
  di.registerLazySingleton<RemoveMeetingItemRepository>(() => RemoveMeetingImplement());
  di.registerLazySingleton<RemoveMeetingCubit>(() =>RemoveMeetingCubit(removeItemRepo: di<RemoveMeetingItemRepository>()));

}
