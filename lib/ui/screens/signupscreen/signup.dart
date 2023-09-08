import 'package:flutter/material.dart';

import 'components/body.dart';


class SignupScreen extends StatelessWidget {
  static String routeName = '/signinScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignupBody(),
    );
  }
}
