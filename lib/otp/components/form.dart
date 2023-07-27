import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constrains.dart';
import '../../widget/default.dart';
import 'otpstats.dart';

class form extends StatefulWidget {
  final String value;
  form({
    Key? key,
    required this.value,
  }) : super(key: key);

  @override
  State<form> createState() => _formState();
}

class _formState extends State<form> {
  late FocusNode pin2FocusNode;
  late FocusNode pin3FocusNode;
  late FocusNode pin4FocusNode;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
  }

  @override
  void dispose() {
    // TODO: implement dispose

    pin2FocusNode.dispose();
    pin3FocusNode.dispose();
    pin4FocusNode.dispose();
    super.dispose();
  }

  void nextField({required String value, required FocusNode focusNode}) {
    if (value.length == 1) {
      focusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0.w),
        child: Column(
          children: [
            Text(
              "Code has been send to ${widget.value}",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xff023020),
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 70.w,
                  child: TextFormField(
                    autofocus: true,
                    obscureText: true,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 32.sp, fontWeight: FontWeight.bold),
                    decoration: otpInputDecoration(),
                    onChanged: (value) {
                      nextField(value: value, focusNode: pin2FocusNode);
                    },
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                SizedBox(
                  width: 70.w,
                  child: TextFormField(
                    focusNode: pin2FocusNode,
                    obscureText: true,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 32.sp, fontWeight: FontWeight.bold),
                    decoration: otpInputDecoration(),
                    onChanged: (value) {
                      nextField(value: value, focusNode: pin3FocusNode);
                    },
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                SizedBox(
                  width: 70.w,
                  child: TextFormField(
                    focusNode: pin3FocusNode,
                    obscureText: true,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 32.sp, fontWeight: FontWeight.bold),
                    decoration: otpInputDecoration(),
                    onChanged: (value) {
                      nextField(value: value, focusNode: pin4FocusNode);
                    },
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                SizedBox(
                  width: 70.w,
                  child: TextFormField(
                    focusNode: pin4FocusNode,
                    obscureText: true,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 32.sp, fontWeight: FontWeight.bold),
                    decoration: otpInputDecoration(),
                    onChanged: (value) {
                      pin4FocusNode.unfocus();
                    
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40.h,
            ),
            stats(context),
            SizedBox(
              height: 140.h,
            ),
            defaultButton(text: "Verify", press: () {}),
          ],
        ),
      ),
    );
  }
}
