import 'package:dio/dio.dart';
import 'package:food_app_for_internship/models/food_product_detail.dart';


class ProductDetailWebService{

  var dio = new Dio();
  Future <List<FoodProductDetail>> fetchProductDetails(String id) async {
    String url = 'https://www.themealdb.com/api/json/v1/1/lookup.php?i=$id';
    final response = await dio.get(url);
    if (response.statusCode == 200){
      final result = response.data;
      Iterable list = result['meals'];
      return list.map((productDetail) => FoodProductDetail.fromJson(productDetail)).toList();
    } else {
        throw Exception("Ürün detayları Getirilirken Hata Oluştu");
    }
  }


}