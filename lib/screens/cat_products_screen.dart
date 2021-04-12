import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_app_for_internship/services/product_web_service.dart';
import 'package:food_app_for_internship/viewmodels/category/food_category_view_model.dart';
import 'package:food_app_for_internship/viewmodels/products/food_product_list_view_model.dart';
import 'package:food_app_for_internship/widgets/loading_animation.dart';
import 'package:food_app_for_internship/widgets/products_screen/main_grid.dart';
import 'package:provider/provider.dart';

class CatProductsPage extends StatefulWidget {
  final FoodCategoryViewModel category;

  const CatProductsPage({this.category});

  @override
  _CatProductsPageState createState() => _CatProductsPageState();
}

class _CatProductsPageState extends State<CatProductsPage> {


  @override
  void initState() {
    super.initState();
    Provider.of<FoodProductListViewModel>(context, listen: false)
        .getProducts("c",widget.category.strCategory);
  }

  @override
  Widget build(BuildContext context) {
    var catProductListViewModel = Provider.of<FoodProductListViewModel>(context);
    return Scaffold(
        backgroundColor: Colors.grey.shade800,
        appBar: AppBar(
          leading: IconButton(icon: Icon(Icons.arrow_back_ios_rounded),onPressed: ()=> Navigator.pop(context),),
          iconTheme: IconThemeData(color: Colors.grey.shade700),
          backgroundColor: Colors.grey.shade300,
          centerTitle: true,
          title: Text(
            widget.category.strCategory,
            style: TextStyle(color: Colors.grey.shade700),
          ),
        ),
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: FutureBuilder(
              future:
                  ProductWebService().fetchProducts("c", widget.category.strCategory,),
              builder: (context, snapshot) {
                if (snapshot.hasData &&
                    catProductListViewModel.products.length > 0) {
                  return MainGrid(regProductListViewModel: catProductListViewModel);
                }
                return LoadingAnimation();
              }),
        ));
  }
}
