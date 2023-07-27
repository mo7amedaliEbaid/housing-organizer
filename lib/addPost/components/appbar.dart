import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar customAppbar() {
  return AppBar(
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.green),
    backgroundColor: Colors.white,
    leading: Icon(Icons.arrow_back_ios),
    title: Text(
      "Add Post",
      style: TextStyle(
        color: Colors.black,
        fontSize: 18.sp,
      ),
    ),
  );
}
