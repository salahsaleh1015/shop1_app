import 'package:flutter/material.dart';
import 'package:shop1_app/module/on_boarding_screen.dart';
import 'package:shop1_app/shared/network/remote/dio_helper.dart';
import 'package:shop1_app/shared/style/theme.dart';

void main() {
  DioHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     theme: lightTheme,
      debugShowCheckedModeBanner: false,
      home: OnBoardingScreen(),
    );
  }
}
