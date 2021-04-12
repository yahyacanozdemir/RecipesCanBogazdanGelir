import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_app_for_internship/constants/grid_view/grid_element_decoration.dart';
import 'package:food_app_for_internship/viewmodels/category/food_category_view_model.dart';

class MainScreenGridItem extends StatelessWidget {
  const MainScreenGridItem({
    Key key,
    @required this.category,
  }) : super(key: key);

  final FoodCategoryViewModel category;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      margin: EdgeInsets.all(5),
      decoration: GridItem.instance.gridItemDecoration,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipOval(
                      child: Container(
                child: CachedNetworkImage(
                  imageUrl: category.strCategoryThumb,
                  placeholder: (context, url) =>
                      Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) =>
                      Center(child: Icon(Icons.error)),
                  
                )),
          ),
          Text(
            category.strCategory,
            style: TextStyle(color: Colors.grey.shade700),
          )
        ],
      ),
    );
  }
}