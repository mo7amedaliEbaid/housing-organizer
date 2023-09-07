import '../widgets/suffixIcon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'customOutlineBorder.dart';

InputDecoration customInputDecoration({
  required IconData? suffixIcon,
  required String hintText,
  required VoidCallback press,
}) {
  return InputDecoration(
    contentPadding: EdgeInsets.fromLTRB(20.w, 0, 0, 0),
    hintText: hintText,
    enabledBorder: customOutlineBorder(),
    suffixIcon: suffixicon(
      press: press,
      icon: suffixIcon,
    ),
    focusedBorder: customOutlineBorder(),
    border: customOutlineBorder(),
  );
}
