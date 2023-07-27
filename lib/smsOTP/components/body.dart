import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../db/authentication/firebase_auth_methods.dart';
import '../../otp/otpScreen.dart';
import '../../widget/customOutlineBorder.dart';
import '../../widget/default.dart';

class Body extends StatefulWidget {
  final int value;
  const Body({Key? key, required this.value}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController _userNumberController = TextEditingController();
  TextEditingController _userEmailController = TextEditingController();
  @override
  void dispose() {
    _userNumberController.dispose();
    _userEmailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    forgotPasswordByEmail() async {
      String res = await FirebaseAuthMethods().forgotPassword(
        context: context,
        email: _userEmailController.text,
      );
    }

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 160.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 24.h,
            ),
            Column(
              children: [
                widget.value == 1
                    ? Text(
                        "Enter the number here we will send a code\non this to verify it. ",
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12.sp,
                        ),
                      )
                    : Text(
                        "Enter the email here we will send a code\non this to verify it. ",
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12.sp,
                        ),
                      ),
                SizedBox(
                  height: 24.h,
                ),
                widget.value == 1
                    ? TextFormField(
                        controller: _userNumberController,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(20.w, 0, 0, 0),
                          hintText: "Phone number",
                          enabledBorder: customOutlineBorder(),
                          suffixIcon: null,
                          prefixIcon: Icon(Icons.phone),
                          focusedBorder: customOutlineBorder(),
                          border: customOutlineBorder(),
                        ),
                      )
                    : TextFormField(
                        controller: _userEmailController,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(20.w, 0, 0, 0),
                          hintText: "Email Address",
                          enabledBorder: customOutlineBorder(),
                          suffixIcon: null,
                          prefixIcon: Icon(Icons.email),
                          focusedBorder: customOutlineBorder(),
                          border: customOutlineBorder(),
                        ),
                      ),
                SizedBox(
                  height: 72.h,
                ),
                defaultButton(
                    text: "Send",
                    press: () {
                      forgotPasswordByEmail();
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
