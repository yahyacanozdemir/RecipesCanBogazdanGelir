import 'package:flutter/material.dart';

class LoadingAnimation extends StatelessWidget {
  const LoadingAnimation({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
          padding: const EdgeInsets.only(top:23.0,bottom: 24),
          child: CircularProgressIndicator(),
        ),
      );
  }
}