import 'package:flutter/material.dart';

Row footer({
  required String text,
  required VoidCallback press,
  required String linkText,
  required Color color,
  required Color linkColor,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        text,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.w500,
        ),
      ),
      GestureDetector(
        onTap: press,
        child: Text(
          linkText,
          style: TextStyle(
            color: linkColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ],
  );
}
