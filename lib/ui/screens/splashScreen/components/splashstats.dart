import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class splashStats extends StatelessWidget {
  splashStats({
    Key? key,
    required this.title,
    required this.desc,
    required this.imageURL,
  }) : super(key: key);
  final String title;
  final String desc;
  final String imageURL;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 34.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 24.0.h),
          child: Image.asset(
            imageURL,
            width: double.infinity,
            height: 200.h,
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.r),
              topRight: Radius.circular(30.r),
            ),
          ),
          child: Column(
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 26.sp,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff023020),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                desc,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18.sp,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
