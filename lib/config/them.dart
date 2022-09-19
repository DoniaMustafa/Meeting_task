import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meeting_task/config/color.dart';

ThemeData them = ThemeData(

  visualDensity: VisualDensity.adaptivePlatformDensity,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme:const AppBarTheme(
    elevation: 0.0,
    backgroundColor:Colors.white,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
    ),
    iconTheme: IconThemeData(
      color: gray,
      size: 30.0,
    ),
  ),
  primarySwatch: Colors.blue,
);