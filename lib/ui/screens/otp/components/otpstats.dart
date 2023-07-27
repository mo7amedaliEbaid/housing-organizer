import 'package:flutter/material.dart';

Column stats(BuildContext context) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "This code will expired in ",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          TweenAnimationBuilder(
            tween: Tween(begin: 30, end: 0.0),
            duration: Duration(seconds: 30),
            builder: (context, value, child) => Text(
              " 00:${value.toString().split(".").first}",
              style: TextStyle(color: Colors.blue),
            ),
          ),
        ],
      ),
    ],
  );
}
