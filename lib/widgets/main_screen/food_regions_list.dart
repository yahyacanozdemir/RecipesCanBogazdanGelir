import 'package:flutter/material.dart';
import 'package:food_app_for_internship/screens/reg_products_screen.dart';
import 'package:food_app_for_internship/viewmodels/products/food_product_list_view_model.dart';
import 'package:food_app_for_internship/viewmodels/region/food_region_view_model.dart';
import 'package:provider/provider.dart';

class RegionList extends StatelessWidget {
  final List<FoodRegionViewModel> regions;

  const RegionList({this.regions});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
      height: MediaQuery.of(context).size.height * 0.10,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: ScrollPhysics(),
          itemCount: this.regions.length,
          itemBuilder: (context, index) {
            var region = regions[index];
            return GestureDetector(
              onTap: () => _showProductsPage(context,region),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.4,
                margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  decoration: BoxDecoration(
                      color: Color(0xff95C13D),
                      borderRadius: BorderRadius.circular(20),
                      border:
                          Border.all(color: Colors.grey.shade400, width: 1)),
                  child: Center(
                      child: Text(
                    region.strArea,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.grey.shade200,
                      fontSize: 24.0,
                    ),
                  )),
                ),
              ),
            );
          }),
    );
  }

  void _showProductsPage(context,region) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => MultiProvider(
                    providers: [
                      ChangeNotifierProvider(create: (_) => FoodProductListViewModel()),
                    ],
                    child: RegProductsPage(
                      region: region,
                    ))));
  }
}
