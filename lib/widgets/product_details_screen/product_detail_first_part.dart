import 'package:flutter/material.dart';

class ProductDetailFirstPart extends StatelessWidget {

  final String productCuisine;
  final String productCategory;
  final String productTags;

  const ProductDetailFirstPart({Key key, this.productCuisine, this.productCategory, this.productTags});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(top: 20),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey.shade200,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Welcome to " + productCuisine + " Cuisine"),
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
          Text("Meal Category : " + productCategory),
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
          createTagsText(productTags),
        ],
      ),
    );
  }

  createTagsText(String tags) {
    if (tags != null && tags != "") {
      return Text("Meal Tags : " + tags);
    } else {
      return Text("Meal Tags : No tags");
    }
  }
}
