import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String pageTitle;

  const CustomAppBar({this.pageTitle});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      excludeHeaderSemantics: true,
      primary: false,
      expandedHeight: MediaQuery.of(context).size.height / 2,
      titleSpacing: 25,
      toolbarHeight: 100,
      elevation: 10,
      pinned: true,
      backgroundColor: Colors.grey.shade300,
      leading: Padding(
          padding: EdgeInsets.only(top: 30),
          child: IconButton(
            color: Colors.grey.shade700,
            icon: Icon(Icons.menu),
            onPressed: () { 
                Scaffold.of(context).openDrawer();
            },
          )),
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Container(
          margin: EdgeInsets.only(left: 0,bottom: 10),
          child: Text(
            pageTitle,
            style: TextStyle(
              color: Colors.grey.shade700,
              fontWeight: FontWeight.w900,
              letterSpacing: 0,
            ),
          ),
        ),
        background: Container(padding: EdgeInsets.all(50),child: Image.asset("assets/images/chef.png",fit: BoxFit.fitWidth,))
      ),
      
      );
  }
}
