import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../feed/feedScreen.dart';

AppBar customAppbar(BuildContext context, String pageinfo) {
  return AppBar(
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.green),
    backgroundColor: Colors.white,
    leading: InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => FeedScreen(),
          ),
        );
      },
      child: Icon(Icons.arrow_back_ios),
    ),
    title: Text(
      pageinfo,
      style: TextStyle(
        color: Colors.black,
        fontSize: 18.sp,
      ),
    ),
    actions: [
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 8.0.w,
        ),
        child: Container(
          margin: EdgeInsets.only(top: 8.h),
          width: 44.w,
          decoration: BoxDecoration(
            color: Colors.green.withOpacity(0.08),
            borderRadius: BorderRadius.circular(14.r),
          ),
          child: Icon(Icons.search),
        ),
      ),
    ],
  );
}
