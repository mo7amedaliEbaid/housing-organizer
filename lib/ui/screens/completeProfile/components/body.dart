import 'package:fashion_app/ui/screens/completeProfile/components/stats.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'form.dart';


class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.only(left: 14.w, right: 14.w, top: 24.h),
          child: Column(
            children: [
              SizedBox(
                height: 24.h,
              ),
              CompleteStats(),
              SizedBox(
                height: 16.h,
              ),
              form(),
              // bottom message
              SizedBox(
                height: 16.h,
              ),
              Text(
                "By continuring your confirm that you agree\nwith our Term and Condition ",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
