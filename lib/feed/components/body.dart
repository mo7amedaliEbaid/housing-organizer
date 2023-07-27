import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    // UserCreaditials user = Provider.of<UserProviders>(context).getUser;
    return Container(
      child: Center(
        child: Text(" welcome!  to the home screen."),
      ),
    );
  }
}
