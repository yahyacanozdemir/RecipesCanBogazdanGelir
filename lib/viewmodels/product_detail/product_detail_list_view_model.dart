import 'package:flutter/cupertino.dart';
import 'package:food_app_for_internship/models/food_product_detail.dart';
import 'package:food_app_for_internship/services/product_detail_web_service.dart';
import 'package:food_app_for_internship/viewmodels/product_detail/product_detail_view_model.dart';


enum LoadingStatus4{
  completed,
  searching,
  empty
}

class FoodProductDetailListViewModel with ChangeNotifier{

  LoadingStatus4 loadingStatus = LoadingStatus4.empty;

  // ignore: deprecated_member_use
  List <FoodProductDetailViewModel> productDetails = List<FoodProductDetailViewModel>();

  void getProductDetails(String id)async{
    List<FoodProductDetail> foodProductDetails = await ProductDetailWebService().fetchProductDetails(id);
    loadingStatus = LoadingStatus4.searching;
    

    this.productDetails = foodProductDetails.map((productDetails) => FoodProductDetailViewModel(foodProductDetail: productDetails)).toList();
    
    
    notifyListeners();
    if(this.productDetails.isEmpty){
      this.loadingStatus = LoadingStatus4.empty;
    } else {
      this.loadingStatus = LoadingStatus4.searching;
    }
  }

}