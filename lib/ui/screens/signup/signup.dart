import 'package:flutter/material.dart';

import '../signup/components/body.dart';

class SignUp extends StatelessWidget {
  static String routeName = '/signupScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
