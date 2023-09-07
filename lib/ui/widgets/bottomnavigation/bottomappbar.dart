import '../../widgets/bottomnavigation/paidstats.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bottom.dart';


Container bottomapp({required BuildContext context, required final snap}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
    height: 100.h,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30.r),
        topRight: Radius.circular(30.r),
      ),
      boxShadow: [
        BoxShadow(
          offset: Offset(0, -15),
          blurRadius: 20,
          color: Color(0xFFDADADA).withOpacity(0.5),
        ),
      ],
    ),
    child: Column(children: [
      Row(
        children: [
          // in column
          paidstats(snap),
          Spacer(),
          bottom(context, snap),
        ],
      ),
    ]),
  );
}
