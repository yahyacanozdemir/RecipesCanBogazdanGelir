import 'package:food_app_for_internship/models/food_category.dart';



class FoodCategoryViewModel{

  FoodCategory _foodCategory;

  FoodCategoryViewModel({FoodCategory category}) : _foodCategory = category;


  String get idCategory {
    return _foodCategory.idCategory;
  }

  String get strCategory {
    return _foodCategory.strCategory;
  }

  String get strCategoryThumb {
    return _foodCategory.strCategoryThumb;
  }

  String get strCategoryDescription {
    return _foodCategory.strCategoryDescription;
  }








}