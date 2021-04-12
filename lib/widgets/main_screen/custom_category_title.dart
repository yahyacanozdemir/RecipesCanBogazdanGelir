import 'package:flutter/material.dart';

class CustomCategoryTitle extends StatelessWidget {
  const CustomCategoryTitle({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0, bottom: 0, left: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Categories",
            style: TextStyle(
              color: Colors.grey.shade300,
              fontSize: 24,
            ),
          )
        ],
      ),
    );
  }
}
