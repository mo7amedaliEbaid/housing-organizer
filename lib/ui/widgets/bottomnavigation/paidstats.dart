import 'package:flutter/material.dart';

Column paidstats(snap) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Total:",
        style: TextStyle(color: Colors.grey),
      ),
      SizedBox(
        height: 5,
      ),
      Text(
        "${snap!['price']}",
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
      ),
    ],
  );
}
