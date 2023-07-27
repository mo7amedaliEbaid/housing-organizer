import 'package:flutter/material.dart';

import '../completeProfile/components/body.dart';

class CompleteProfle extends StatelessWidget {
// route
  static String routeName = '/completeProfile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
