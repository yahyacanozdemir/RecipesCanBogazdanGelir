import 'package:flutter/material.dart';
import 'package:food_app_for_internship/screens/main_screen.dart';
import 'package:food_app_for_internship/screens/splash_screen.dart';

void main(){ 
  ErrorWidget.builder=(FlutterErrorDetails details) => Scaffold(backgroundColor: Colors.grey.shade800,body: Center(child: CircularProgressIndicator(),),);
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'USG Food App',
      theme: ThemeData(),
      routes: {
        '/' : (context) => SplashScreen(),
        '/anasayfa' : (context) => MainScreen(),
      },
    );
  }
}
