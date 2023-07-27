import 'package:flutter/material.dart';

Widget splashDots({required int index, required int currentIndex}) {
  return AnimatedContainer(
    duration: Duration(milliseconds: 600),
    margin: EdgeInsets.only(right: 5),
    width: currentIndex == index ? 8 : 6,
    height: currentIndex == index ? 8 : 6,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(3),
      color: currentIndex == index ? Color(0xff023020) : Colors.grey,
    ),
  );
}
