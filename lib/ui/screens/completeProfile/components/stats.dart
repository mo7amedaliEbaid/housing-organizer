import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CompleteStats extends StatelessWidget {
  const CompleteStats({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Complete Profile",
          style: Theme.of(context).textTheme.headline4!.copyWith(
                color: Color(0xff023020),
                fontWeight: FontWeight.bold,
              ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(
          "Complete your detail and continue\nwith social media",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
