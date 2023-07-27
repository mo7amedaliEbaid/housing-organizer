import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Row header() {
  return Row(
    children: [
      Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10)),
        width: 40,
        height: 60,
        child: SvgPicture.asset('assets/icons/receipt.svg'),
      ),
      Spacer(),
      Text(
        "Add voucher code",
        style: TextStyle(color: Colors.grey),
      ),
      SizedBox(
        width: 5,
      ),
      Icon(
        Icons.arrow_forward_ios,
        color: Colors.grey,
      ),
    ],
  );
}
