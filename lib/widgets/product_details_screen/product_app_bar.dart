import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductAppBar extends StatelessWidget {
  bool localFavoriteValue = false;

  final String pageTitle;
  final String bcgrUrl;
  final String productId;

  ProductAppBar({this.pageTitle, this.bcgrUrl, this.productId});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      excludeHeaderSemantics: true,
      primary: false,
      expandedHeight: MediaQuery.of(context).size.height / 3,
      titleSpacing: 25,
      toolbarHeight: 100,
      elevation: 10,
      floating: true,
      snap: false,
      pinned: false,
      leading: Text(""),
      backgroundColor: Colors.grey.shade800,
      forceElevated: true,
      actions: <Widget>[],
      flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          titlePadding: EdgeInsets.only(top:20),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                child: IconButton(
                  color: Colors.grey.shade300,
                  icon: Icon(Icons.arrow_back_ios_rounded),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width/3,
                child: Text(
                  pageTitle,
                  style: TextStyle(
                    color: Colors.grey.shade300,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    letterSpacing: 0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                padding: EdgeInsets.all(15),
                child: FutureBuilder(
                  future: getFavorite(productId),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return GestureDetector(
                          child: Icon(
                            Icons.favorite_sharp,
                            color:
                                localFavoriteValue ? Colors.red : Colors.grey,
                          ),
                          onTap: () {
                            _showMyDialog(context);
                          });
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                ),
              ),
            ],
          ),

          background: Container(
            margin: EdgeInsets.only(bottom:50),
            child: CachedNetworkImage(
              imageUrl: bcgrUrl,
              placeholder: (context, url) =>
                  Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) =>
                  Center(child: Icon(Icons.error)),
              imageBuilder: (context, imageProvider) {
                return Container(
                  margin: EdgeInsets.only(bottom: 40),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                      image: DecorationImage(
                          image: imageProvider, fit: BoxFit.cover)),
                );
              },
            ),
          )),
    );
  }
  getFavorite(String id) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      localFavoriteValue = prefs.getBool(productId.toString());
      if (localFavoriteValue == null) localFavoriteValue = false;
    } catch (Exception) {
      throw ("getFavorite Hatası : " + Exception);
    }
    return localFavoriteValue;
  }
}

Future<void> _showMyDialog(context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          'Opps',
          textAlign: TextAlign.center,
        ),
        content: Text(
          "Favorite fetaure is currently available on product cards.",
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.grey.shade300,
        elevation: 20,
      );
    },
  );
}
