import 'package:button_animations/button_animations.dart';
import 'package:button_animations/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_app_for_internship/viewmodels/product_detail/product_detail_view_model.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductDetailSecondPart extends StatelessWidget {
  final FoodProductDetailViewModel product;

  const ProductDetailSecondPart({Key key, this.product});



  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(top: 20),
      //height: 1000,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey.shade200,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Ingredient",
                style: TextStyle(fontWeight: FontWeight.w800),
              ),
              Text("Measure", style: TextStyle(fontWeight: FontWeight.w800)),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            height: 5,
            color: Colors.black,
          ),
          SizedBox(
            height: 10,
          ),
          createIngredientText(product.strIngredient1, product.strMeasure1),
          createIngredientText(product.strIngredient2, product.strMeasure2),
          createIngredientText(product.strIngredient3, product.strMeasure3),
          createIngredientText(product.strIngredient4, product.strMeasure4),
          createIngredientText(product.strIngredient5, product.strMeasure5),
          createIngredientText(product.strIngredient6, product.strMeasure6),
          createIngredientText(product.strIngredient7, product.strMeasure7),
          createIngredientText(product.strIngredient8, product.strMeasure8),
          createIngredientText(product.strIngredient9, product.strMeasure9),
          createIngredientText(product.strIngredient10, product.strMeasure10),
          createIngredientText(product.strIngredient11, product.strMeasure11),
          createIngredientText(product.strIngredient12, product.strMeasure12),
          createIngredientText(product.strIngredient13, product.strMeasure13),
          createIngredientText(product.strIngredient14, product.strMeasure14),
          createIngredientText(product.strIngredient15, product.strMeasure15),
          createIngredientText(product.strIngredient16, product.strMeasure16),
          createIngredientText(product.strIngredient17, product.strMeasure17),
          createIngredientText(product.strIngredient18, product.strMeasure18),
          createIngredientText(product.strIngredient19, product.strMeasure19),
          createIngredientText(product.strIngredient20, product.strMeasure20),
          SizedBox(
            height: 10,
          ),
          Divider(
            height: 5,
            color: Colors.black,
          ),
          SizedBox(
            height: 10,
          ),
          Text("Directions", style: TextStyle(fontWeight: FontWeight.w800)),
          SizedBox(
            height: 10,
          ),
          Divider(
            height: 5,
            color: Colors.black,
          ),
          SizedBox(
            height: 10,
          ),
          Text(product.strInstructions),
          SizedBox(
            height: 10,
          ),
          Divider(
            height: 5,
            color: Colors.black,
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Youtube Guide",
                style: TextStyle(fontWeight: FontWeight.w800),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            height: 5,
            color: Colors.black,
          ),
          SizedBox(
            height: 10,
          ),
          AnimatedButton(
            onTap: () => launchURL(product.strYoutube),
            type: PredefinedThemes.danger,
            child: Icon(
              FontAwesomeIcons.youtube,
              color: Colors.white,
              size: 25,
            ),
          )
        ],
      ),
    );
  }

    launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw '$url Adresi Açılamadı.';
    }
  }

  createIngredientText(String ingredient, String measure) {
    if (ingredient != null &&
        measure != null &&
        ingredient != "" &&
        measure != "") {
      return Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(ingredient),
          Text(measure),
        ],
      );
    } else {
      return Container();
    }
  }
}
