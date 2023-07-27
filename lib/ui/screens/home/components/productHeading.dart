import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Row productHeading({
  required String title,
  required String text,
  required VoidCallback press,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      TextButton(
        onPressed: press,
        child: Text(
          text,
          style: TextStyle(color: Colors.green),
        ),
      ),
    ],
  );
}
