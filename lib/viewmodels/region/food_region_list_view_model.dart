import 'package:flutter/material.dart';
import 'package:food_app_for_internship/models/food_region.dart';
import 'package:food_app_for_internship/services/main_page_web_service.dart';
import 'package:food_app_for_internship/viewmodels/region/food_region_view_model.dart';


enum LoadingStatus2{
  completed,
  searching,
  empty
}

class FoodRegionListViewModel with ChangeNotifier{
  LoadingStatus2 loadingStatus = LoadingStatus2.empty;
  // ignore: deprecated_member_use
  List <FoodRegionViewModel> regions = List<FoodRegionViewModel>();

  void getRegions()async{
    List<FoodRegion> foodRegions = await MainPageWebService().fetchRegions();
    loadingStatus = LoadingStatus2.searching;
    notifyListeners();

    this.regions = foodRegions.map((region) => FoodRegionViewModel(region: region)).toList();

    if(this.regions.isEmpty){
      this.loadingStatus = LoadingStatus2.empty;
    } else {
      this.loadingStatus = LoadingStatus2.searching;
    }


  }
}