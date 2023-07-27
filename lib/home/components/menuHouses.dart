import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget menuButton({
  required IconData iconData,
  required String text,
  required VoidCallback press,
}) {
  return OutlinedButton(
    style: ButtonStyle(
      padding: MaterialStateProperty.all(
        EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
      ),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    ),
    onPressed: press,
    child: Center(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 8.h),
            child: Container(
              width: 60.w,
              height: 60.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green[100],
              ),
              child: Icon(
                iconData,
                color: Color(0xff023020),
              ),
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          text == "Apartment"
              ? Text(
                  text,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                  ),
                )
              : Padding(
                  padding: EdgeInsets.only(left: 16.0.w, right: 16.w),
                  child: Text(
                    text,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
        ],
      ),
    ),
  );
}
