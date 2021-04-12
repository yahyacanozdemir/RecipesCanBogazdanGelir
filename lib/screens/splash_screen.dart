import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:food_app_for_internship/screens/main_screen.dart';
import 'package:food_app_for_internship/viewmodels/category/food_category_list_view_model.dart';
import 'package:food_app_for_internship/viewmodels/region/food_region_list_view_model.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
        Duration(milliseconds: 1000),
        () => Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) =>MultiProvider(providers: [
              ChangeNotifierProvider(
                  create: (_) => FoodCategoryListViewModel()),
              ChangeNotifierProvider(create: (_) => FoodRegionListViewModel()),
            ], child: MainScreen()))));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade300,
        body: Center(
          child: Image.asset("assets/images/chef_title_2.png")
        ),
      ),
    );
  }
}
