import 'package:flutter/material.dart';
import 'package:food_app_for_internship/screens/cat_products_screen.dart';
import 'package:food_app_for_internship/viewmodels/category/food_category_view_model.dart';
import 'package:food_app_for_internship/viewmodels/products/food_product_list_view_model.dart';
import 'package:food_app_for_internship/widgets/main_screen/main_screen_grid_item.dart';
import 'package:provider/provider.dart';

class CategoryGrid extends StatelessWidget {
  final List<FoodCategoryViewModel> categories;

  CategoryGrid({this.categories});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
      child: GridView.builder(
        padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 25),
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: MediaQuery.of(context).size.width /
                (MediaQuery.of(context).size.height / 2)),
        itemBuilder: (context, index) {
          var category = categories[index];
          return GestureDetector(
            onTap: () {
              _goProductsPage(context, category);
            },
            child: MainScreenGridItem(category: category),
          );
        },
        itemCount: this.categories.length,
      ),
    );
  }

  void _goProductsPage(context, category) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => MultiProvider(
                    providers: [
                      ChangeNotifierProvider(
                          create: (_) => FoodProductListViewModel()),
                    ],
                    child: CatProductsPage(
                      category: category,
                    ))));
  }
}
