import 'package:flutter/material.dart';
import 'package:food_app_for_internship/screens/product_details_screen.dart';
import 'package:food_app_for_internship/viewmodels/product_detail/product_detail_list_view_model.dart';
import 'package:food_app_for_internship/viewmodels/products/food_product_list_view_model.dart';
import 'package:food_app_for_internship/widgets/products_screen/grid_item.dart';
import 'package:provider/provider.dart';

class MainGrid extends StatelessWidget {
  const MainGrid({
    Key key,
    @required this.regProductListViewModel,
  }) : super(key: key);

  final FoodProductListViewModel regProductListViewModel;
  

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 0.7,
            mainAxisSpacing: 0,
            crossAxisSpacing: 0),
            itemCount: regProductListViewModel.products.length,
          itemBuilder: (context, index) {
          var product = regProductListViewModel.products[index];
          return GestureDetector(
            onTap: ()=> _goProductDetailsPage(context,product),
            child: CustomGridItem(product: product),
          );
        });
  }

void _goProductDetailsPage(context,product) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => MultiProvider(
                    providers: [
                      ChangeNotifierProvider(
                          create: (_) => FoodProductDetailListViewModel()),
                    ],
                    child: ProductDetailsScreen(
                      product: product,
                    ))));
  }

}

