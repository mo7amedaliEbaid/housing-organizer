import '../../..//screens/signinscreen/signin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/footer.dart';
import '../../../widgets/sociallinks.dart';
import '../../forgot/forgotPassword.dart';
import '../../signupscreen/components/form.dart';


class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 8.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 44.w, vertical: 24.h),
              child: Image.asset("assets/images/eral.jpg"),
            ),
            Text(
              "Create an account for free",
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
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(ForgotScreen.routeName);
              },
              child: Text(
                "Forgot password?",
                style: TextStyle(
                  color: Color(0xff023020),
                  fontWeight: FontWeight.w700,
                  fontSize: 17.sp,
                ),
              ),
            ),
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
              height: 24.h,
            ),
            SocialLinks(),
            SizedBox(
              height: 16.h,
            ),
            footer(
              text: "Already have an account? ",
              press: () {
                Navigator.of(context).pushNamed(Signin.routeName);
              },
              linkText: "Sign in",
              color: Colors.grey,
              linkColor: Color(0xff023020),
            )
          ],
        ),
      ),
    );
  }
}
