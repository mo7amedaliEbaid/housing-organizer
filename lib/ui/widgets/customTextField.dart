import 'package:flutter/material.dart';

class CTextFormField extends StatelessWidget {
  final TextEditingController controller;
  const CTextFormField({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
    );
  }
}
