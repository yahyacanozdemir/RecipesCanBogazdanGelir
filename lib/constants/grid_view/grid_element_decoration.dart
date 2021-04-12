import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GridItem {
  static GridItem instance = GridItem._init();
  GridItem._init();

  BoxDecoration gridItemDecoration = BoxDecoration(
    color: Colors.grey.shade300,
    borderRadius: BorderRadius.circular(20),
    border: Border.all(color: Color(0xff95C13D), width: 1),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.2),
        spreadRadius: 5,
        blurRadius: 1,
        offset: Offset(0, 3), // changes position of shadow
      ),
    ],
  );

//Çağırmak için GridItem.instance.gridItemDecoration
}
