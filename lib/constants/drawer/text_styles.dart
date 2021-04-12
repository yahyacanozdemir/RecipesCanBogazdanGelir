import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextStyleConstants{
  static TextStyleConstants instance = TextStyleConstants._init();
  TextStyleConstants._init();

    TextStyle partTitleStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w900,
    color: Colors.grey.shade800,
    letterSpacing: 1,
    wordSpacing: 2,
  );

  TextStyle appInfoTitleStyle = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w300,
      color: Colors.grey.shade800,
      letterSpacing: 1,
      wordSpacing: 2);

  TextStyle appInfoTextStyle = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w900,
      color: Colors.grey.shade800,
      letterSpacing: 1,
      wordSpacing: 2);



//Çağırmak için TextStyleConstants.instance.partTitleStyle
}