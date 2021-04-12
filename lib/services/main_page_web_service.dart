import 'package:dio/dio.dart';
import 'package:food_app_for_internship/models/food_category.dart';
import 'package:food_app_for_internship/models/food_region.dart';

class MainPageWebService{
  var dio = new Dio();

  Future <List<FoodCategory>> fetchCategories() async {
    String url = 'https://www.themealdb.com/api/json/v1/1/categories.php';
    final response = await dio.get(url);
    if (response.statusCode == 200){
      final result = response.data;
      Iterable list = result['categories'];
      return list.map((category) => FoodCategory.fromJson(category)).toList();
    } else {
        throw Exception("Kategoriler Getirilirken Hata Oluştu");
    }
  }

  Future <List<FoodRegion>> fetchRegions() async {
    String url = 'https://www.themealdb.com/api/json/v1/1/list.php?a=list';
    final response = await dio.get(url);
    if (response.statusCode == 200){
      final result = response.data;
      Iterable list = result['meals'];
      return list.map((region) => FoodRegion.fromJson(region)).toList();
    } else {
        throw Exception("Bölgeler Getirilirken Hata Oluştu");

    }
  }

  

  



  



}