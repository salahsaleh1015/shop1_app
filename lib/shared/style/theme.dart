import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightTheme = ThemeData(
    textTheme: TextTheme(
        bodyText1: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.w600
        )
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation: 20,
        type: BottomNavigationBarType.fixed,
        unselectedIconTheme: IconThemeData(color: Colors.grey)),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(

        actionsIconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0.0,
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          
        )));