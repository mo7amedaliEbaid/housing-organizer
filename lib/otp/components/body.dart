import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widget/default.dart';
import 'form.dart';
import 'otpstats.dart';

class Body extends StatelessWidget {
  final String value;
  Body({required this.value});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0.w),
          child: Column(
            children: [
              SizedBox(
                height: 50.h,
              ),
              SizedBox(
                height: 140.h,
              ),
              form(
                value: value,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
