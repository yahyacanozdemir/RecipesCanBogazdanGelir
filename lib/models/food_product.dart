class FoodProduct{
  final String strMeal ;
  final String strMealThumb;
  final String idMeal;

  FoodProduct({this.strMeal,this.strMealThumb,this.idMeal});

  factory FoodProduct.fromJson(Map<String, dynamic> json){
    return FoodProduct(
      strMeal: json['strMeal'],
      strMealThumb: json['strMealThumb'],
      idMeal: json['idMeal'],
    );
  }
}