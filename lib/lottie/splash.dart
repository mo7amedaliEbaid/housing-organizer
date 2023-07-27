import 'package:flutter/material.dart';

import '../lottie/components/body.dart';

class Lottie extends StatelessWidget {
  static String routeName = "/firstScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
