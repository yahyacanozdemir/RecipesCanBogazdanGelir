import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_app_for_internship/viewmodels/category/food_category_list_view_model.dart';
import 'package:food_app_for_internship/viewmodels/region/food_region_list_view_model.dart';
import 'package:food_app_for_internship/widgets/main_screen/custom_app_bar.dart';
import 'package:food_app_for_internship/widgets/main_screen/custom_category_title.dart';
import 'package:food_app_for_internship/widgets/drawer/custom_drawer.dart';
import 'package:food_app_for_internship/widgets/main_screen/custom_region_title.dart';
import 'package:food_app_for_internship/widgets/main_screen/food_categories_grid.dart';
import 'package:food_app_for_internship/widgets/main_screen/food_regions_list.dart';
import 'package:food_app_for_internship/widgets/loading_animation.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<FoodCategoryListViewModel>(context, listen: false)
        .getCategories();
    Provider.of<FoodRegionListViewModel>(context, listen: false).getRegions();
  }

  @override
  Widget build(BuildContext context) {
    var catListViewModel = Provider.of<FoodCategoryListViewModel>(context);
    var regListViewModel = Provider.of<FoodRegionListViewModel>(context);

    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      drawer: Drawer(child: CustomDrawer(),),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: CustomScrollView(
          primary: false,
          slivers: [
            CustomAppBar(pageTitle: "Can Bogazdan Gelir",),
            SliverToBoxAdapter(
              child: Column(
                  children: [
                    CustomRegionTitle(),
                    catListViewModel.loadingStatus == LoadingStatus.empty
                        ? LoadingAnimation()
                        : RegionList(regions: regListViewModel.regions),
                    CustomCategoryTitle(),
                    catListViewModel.loadingStatus == LoadingStatus.empty
                        ? LoadingAnimation()
                        : CategoryGrid(
                            categories: catListViewModel.categories,
                          ),
                  ],
                ),
              
            ),
          ],
        ),
      ),
    );
  }
}

