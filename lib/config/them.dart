import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      color: Colors.grey,
      size: 25.0,
    ),
  ),
  primarySwatch: Colors.blue,
);