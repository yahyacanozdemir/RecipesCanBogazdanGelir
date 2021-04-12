import 'package:flutter/material.dart';

class CustomRegionTitle extends StatelessWidget {
  const CustomRegionTitle({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0, bottom: 15, left: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Local Cuisines",
            style: TextStyle(
              color: Colors.green.shade100,
              fontSize: 24,
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
