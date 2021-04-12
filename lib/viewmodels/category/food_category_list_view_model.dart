import 'package:flutter/material.dart';
import 'package:food_app_for_internship/models/food_category.dart';
import 'package:food_app_for_internship/services/main_page_web_service.dart';

import 'food_category_view_model.dart';


enum LoadingStatus{
  completed,
  searching,
  empty
}

class FoodCategoryListViewModel with ChangeNotifier{
  LoadingStatus loadingStatus = LoadingStatus.empty;

  // ignore: deprecated_member_use
  List <FoodCategoryViewModel> categories = List<FoodCategoryViewModel>();

  void getCategories()async{
    List<FoodCategory> foodCategories = await MainPageWebService().fetchCategories();
    loadingStatus = LoadingStatus.searching;
    notifyListeners();

    this.categories = foodCategories.map((category) => FoodCategoryViewModel(category: category)).toList();

    if(this.categories.isEmpty){
      this.loadingStatus = LoadingStatus.empty;
    } else {
      this.loadingStatus = LoadingStatus.searching;
    }


  }
}