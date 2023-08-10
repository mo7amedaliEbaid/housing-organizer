import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/footer.dart';
import '../../../widgets/sociallinks.dart';
import '../../signinscreen/components/form.dart';
import '../../signupscreen/signup.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          left: 20.w,
          right: 20.w,
          top: 60.h,
          bottom: 4.h,
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 44.w, vertical: 24.h),
              child: Image.asset("assets/images/eral.jpg"),
            ),
            Text(
              "Sign in to  your account",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 24.sp,
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            FormFields(),
            SizedBox(
              height: 16.h,
            ),
            Row(
              children: [
                Expanded(
                  child: Divider(
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text("or Continue with"),
                SizedBox(
                  width: 10.w,
                ),
                Expanded(
                  child: Divider(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16.h,
            ),
            const SocialLinks(),
            SizedBox(
              height: 16.h,
            ),
            footer(
              text: "Dont\'t have account? ",
              press: () {
                Navigator.of(context).pushNamed(SignupScreen.routeName);
              },
              linkText: "Sign up",
              color: Colors.grey,
              linkColor: Color(0xff023020),
            ),
          ],
        ),
      ),
    );
  }
}
