import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Padding customTextFieldLable({
  required String lableText,
  required bool isRequired,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 24.0.w),
    child: Row(
      children: [
        Text(
          lableText,
          style: TextStyle(
            color: Color(0xff023020),
            fontWeight: FontWeight.w600,
            fontSize: 16.sp,
          ),
        ),
        isRequired
            ? Text(
                "*",
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp,
                ),
              )
            : Text(""),
      ],
    ),
  );
}
