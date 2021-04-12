import 'package:cached_network_image/cached_network_image.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:food_app_for_internship/constants/grid_view/grid_element_decoration.dart';
import 'package:food_app_for_internship/viewmodels/products/food_product_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomGridItem extends StatelessWidget {
  CustomGridItem({
    Key key,
    @required this.product,
  }) : super(key: key);

  final FoodProductViewModel product;
  bool localFavoriteValue = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      decoration: GridItem.instance.gridItemDecoration,
      child: Stack(
        children: [
          Container(
              child: CachedNetworkImage(
            imageUrl: product.strMealThumb,
            placeholder: (context, url) =>
                Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) =>
                Center(child: Icon(Icons.error)),
            imageBuilder: (context, imageProvider) {
              return Container(
                margin: EdgeInsets.only(bottom: 40),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: imageProvider, fit: BoxFit.cover)),
              );
            },
          )),
          Positioned(
            top: -1,
            right: -1,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(20)),
              child: FutureBuilder(
                future: getFavorite(product.idMeal),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                      return FavoriteButton(
                        iconSize: 35,
                        isFavorite: localFavoriteValue,
                        valueChanged: (_isFavorite) async {
                          setFavorite(product.idMeal, _isFavorite);
                        },
                      );
                  } else {
                   return CircularProgressIndicator();
                  }
                },
              )
              ,
            ),
          ),
          Positioned(
            bottom: 10,
            right: 10,
            left: 10,
            child: Text(
              product.strMeal,
              style: TextStyle(
                color: Colors.grey.shade700,
              ),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  setFavorite(String id, bool isFavorite) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool(id.toString(), isFavorite);
    } catch (Exception) {
      throw("setFavorite Hatası : "+Exception);
    }
  }

  getFavorite(String id) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      localFavoriteValue = prefs.getBool(product.idMeal.toString());
      if(localFavoriteValue==null)
      localFavoriteValue=false;
    } catch (Exception) {
      throw("getFavorite Hatası : "+Exception);
    }
    return localFavoriteValue;
  }



}
