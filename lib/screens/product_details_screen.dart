import 'package:flutter/material.dart';
import 'package:food_app_for_internship/services/product_detail_web_service.dart';
import 'package:food_app_for_internship/viewmodels/product_detail/product_detail_list_view_model.dart';
import 'package:food_app_for_internship/viewmodels/products/food_product_view_model.dart';
import 'package:food_app_for_internship/widgets/loading_animation.dart';
import 'package:food_app_for_internship/widgets/product_details_screen/product_detail_first_part.dart';
import 'package:food_app_for_internship/widgets/product_details_screen/product_app_bar.dart';
import 'package:food_app_for_internship/widgets/product_details_screen/second_part.dart';
import 'package:provider/provider.dart';

class ProductDetailsScreen extends StatefulWidget {
  final FoodProductViewModel product;

  const ProductDetailsScreen({this.product});

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  void initState() {
    super.initState();
    Provider.of<FoodProductDetailListViewModel>(context, listen: false)
        .getProductDetails(widget.product.idMeal);
  }

  @override
  Widget build(BuildContext context) {
    var productDetailListViewModel =
        Provider.of<FoodProductDetailListViewModel>(context);
    var product = productDetailListViewModel.productDetails[0];

    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      body: FutureBuilder(
          future: ProductDetailWebService().fetchProductDetails(product.idMeal),
          builder: (context, snapshot) {
            if (snapshot.hasData &&
                productDetailListViewModel.productDetails[0].idMeal!="") {
              return CustomScrollView(
                primary: false,
                slivers: [
                  ProductAppBar(
                    pageTitle: product.strMeal,
                    bcgrUrl: product.strCategoryThumb,
                    productId: product.idMeal,
                  ),
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        ProductDetailFirstPart(productCuisine: product.strArea,productCategory: product.strCategory,productTags: product.strTags,),
                        ProductDetailSecondPart(product: product,),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return LoadingAnimation();
            }
          }),
    );
  }



 
}
