import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

OutlinedButton customOutLinedBUtton({
  required String imageURl,
  required VoidCallback press,
}) {
  return OutlinedButton(
    style: OutlinedButton.styleFrom(
        primary: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        side: BorderSide(
          color: Colors.grey,
        ),
        minimumSize: Size(130.w, 48.h)),
    onPressed: press,
    child: Padding(
      padding: const EdgeInsets.all(0),
      child: SvgPicture.asset(imageURl),
    ),
  );
}
