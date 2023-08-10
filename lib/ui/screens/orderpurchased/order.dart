import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:lottie/lottie.dart';

import '../../widgets/default.dart';
import '../feed/feedScreen.dart';

class Order extends StatelessWidget {
  const Order({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Spacer(),
        Center(
          child: Lottie.asset(
            "assets/lottie/purchased.json",
            height: 200.h,
            width: 190.w,
          ),
        ),
        Spacer(),
        defaultButton(
            text: "Go to Home",
            press: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => FeedScreen()));
            })
      ],
    ));
  }
}
