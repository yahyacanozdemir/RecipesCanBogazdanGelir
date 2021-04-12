import 'package:food_app_for_internship/models/food_region.dart';

class FoodRegionViewModel{

  FoodRegion _foodRegion;

  FoodRegionViewModel({FoodRegion region}) : _foodRegion = region;


  String get strArea {
    return _foodRegion.strArea;
  }









}