import 'package:flutter/material.dart';

Widget suffixicon({required IconData? icon, required VoidCallback press}) {
  return InkWell(
    onTap: press,
    child: Padding(
      padding: const EdgeInsets.fromLTRB(0, 3, 20, 3),
      child: Icon(
        icon,
        size: 30,
      ),
    ),
  );
}
