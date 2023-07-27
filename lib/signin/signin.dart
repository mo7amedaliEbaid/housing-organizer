import 'package:flutter/material.dart';

import '../signin/components/body.dart';

class Signin extends StatelessWidget {
  static String routeName = '/signinScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
