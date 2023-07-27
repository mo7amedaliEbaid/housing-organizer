import 'package:flutter/material.dart';

AppBar appbartheme({required String title}) {
  return AppBar(
    title: Text(
      title,
      style: TextStyle(color: Colors.grey),
    ),
  );
}
