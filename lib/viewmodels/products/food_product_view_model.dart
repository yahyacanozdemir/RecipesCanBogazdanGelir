import 'package:food_app_for_internship/models/food_product.dart';

class FoodProductViewModel{

  FoodProduct _foodProduct;

  FoodProductViewModel ({FoodProduct foodProduct}) : _foodProduct = foodProduct ;  

  String get strMeal{
    return _foodProduct.strMeal;
  }
  String get strMealThumb{
    return _foodProduct.strMealThumb;
  }
  String get idMeal{
    return _foodProduct.idMeal;
  }

}