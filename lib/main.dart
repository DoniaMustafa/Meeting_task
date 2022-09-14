import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meeting_task/config/them.dart';
import 'package:meeting_task/presentation/cubit/get_data/get_data_cubit.dart';
import 'package:meeting_task/utils/di.dart';
import 'package:meeting_task/presentation/cubit/create_task/create_task_cubit.dart';
import 'package:meeting_task/presentation/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initializeDependency();
  runApp(
    BlocProvider(
      create: (context) =>  di<GetDataCubit>()
        ..getData(),
      child:const MyApp(),
      // DevicePreview(
      //   builder: (context) =>
      //   enabled: !kReleaseMode,
      // ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp

  ({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      di<GetDataCubit>()
        ..getData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: them,
        home: HomeScreen(),
      ),
    );
  }
}
