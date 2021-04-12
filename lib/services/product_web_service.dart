import 'package:dio/dio.dart';
import 'package:food_app_for_internship/models/food_product.dart';


class ProductWebService{

  var dio = new Dio();
  Future <List<FoodProduct>> fetchProducts(String param1,String param2) async {
    String url = 'https://www.themealdb.com/api/json/v1/1/filter.php?$param1=$param2';
    final response = await dio.get(url);
    if (response.statusCode == 200){
      final result = response.data;
      Iterable list = result['meals'];
      return list.map((product) => FoodProduct.fromJson(product)).toList();
    } else {
        throw Exception("Ürünler Getirilirken Hata Oluştu");

    }
  }


}