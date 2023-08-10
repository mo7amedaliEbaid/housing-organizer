import 'package:flutter/material.dart';

import '../signinscreen/components/body.dart';

class Signin extends StatelessWidget {
  static String routeName = '/signupScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
