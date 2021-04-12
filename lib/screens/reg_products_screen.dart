import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_app_for_internship/services/product_web_service.dart';
import 'package:food_app_for_internship/viewmodels/products/food_product_list_view_model.dart';
import 'package:food_app_for_internship/viewmodels/region/food_region_view_model.dart';
import 'package:food_app_for_internship/widgets/products_screen/main_grid.dart';
import 'package:food_app_for_internship/widgets/loading_animation.dart';
import 'package:provider/provider.dart';

class RegProductsPage extends StatefulWidget {
  final FoodRegionViewModel region;

  const RegProductsPage({this.region});

  @override
  _RegProductsPageState createState() => _RegProductsPageState();
}

class _RegProductsPageState extends State<RegProductsPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<FoodProductListViewModel>(context, listen: false)
        .getProducts("a", widget.region.strArea);
  }

  @override
  Widget build(BuildContext context) {
    var regProductListViewModel =
        Provider.of<FoodProductListViewModel>(context);
    return Scaffold(
        backgroundColor: Colors.grey.shade800,
        appBar: AppBar(
          leading: IconButton(icon: Icon(Icons.arrow_back_ios_rounded),onPressed: ()=> Navigator.pop(context),),
          iconTheme: IconThemeData(color: Colors.grey.shade700),
          backgroundColor: Colors.grey.shade300,
          centerTitle: true,
          title: Text(
            widget.region.strArea,
            style: TextStyle(color: Colors.grey.shade700),
          ),
        ),
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: FutureBuilder(
              future:
                  ProductWebService().fetchProducts("a", widget.region.strArea),
              builder: (context, snapshot) {
                if (snapshot.hasData &&
                    regProductListViewModel.products.length > 0) {
                  return MainGrid(regProductListViewModel: regProductListViewModel);
                }
                return LoadingAnimation();
              }),
        ));
  }
}


