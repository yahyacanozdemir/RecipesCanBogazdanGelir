import 'package:flutter/cupertino.dart';
import 'package:food_app_for_internship/models/food_product.dart';
import 'package:food_app_for_internship/services/product_web_service.dart';

import '../products/food_product_view_model.dart';

enum LoadingStatus3{
  completed,
  searching,
  empty
}

class FoodProductListViewModel with ChangeNotifier{

  LoadingStatus3 loadingStatus = LoadingStatus3.empty;
  // ignore: deprecated_member_use
  List <FoodProductViewModel> products = List<FoodProductViewModel>();

  void getProducts(String param1,String param2)async{
    List<FoodProduct> foodProducts = await ProductWebService().fetchProducts(param1,param2);
    loadingStatus = LoadingStatus3.searching;
    notifyListeners();

    this.products = foodProducts.map((product) => FoodProductViewModel(foodProduct: product)).toList();

    if(this.products.isEmpty){
      this.loadingStatus = LoadingStatus3.empty;
    } else {
      this.loadingStatus = LoadingStatus3.searching;
    }
  }

}