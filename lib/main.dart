import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meeting_task/config/them.dart';
import 'package:meeting_task/presentation/cubit/get_data/get_data_cubit.dart';
import 'package:meeting_task/presentation/screens/mobile/home_screen.dart';
import 'package:meeting_task/utils/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initializeDependency();
  runApp(
    DevicePreview(
      builder: (context) =>
          BlocProvider(
            create: (context) =>di<GetDataCubit>()..getDate()..getData(),
            child:MyApp(),
          ),
      enabled: !kReleaseMode,
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: them,
      // initialRoute: '/home',
      // routes: {
      //   '/home': (context) => HomeScreen(),
      // },

          useInheritedMediaQuery: true,
          home: HomeScreen(),
        );
  }
}
