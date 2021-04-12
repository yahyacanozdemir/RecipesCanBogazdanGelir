class FoodCategory{
  final String idCategory ;
  final String strCategory;
  final String strCategoryThumb;
  final String strCategoryDescription;

  FoodCategory({this.idCategory, this.strCategory, this.strCategoryThumb, this.strCategoryDescription});

  factory FoodCategory.fromJson(Map<String, dynamic> json){
    return FoodCategory(
      idCategory: json['idCategory'],
      strCategory: json['strCategory'],
      strCategoryThumb: json['strCategoryThumb'],
      strCategoryDescription: json['strCategoryDescription']
    );
  }
}