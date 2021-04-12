class FoodRegion{
  final String strArea ;

  FoodRegion({this.strArea,});

  factory FoodRegion.fromJson(Map<String, dynamic> json){
    return FoodRegion(
      strArea: json['strArea'],
    );
  }
}