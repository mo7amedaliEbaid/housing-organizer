import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../services/firebase_auth_methods.dart';
import '../../../widgets/customSnakeBar.dart';
import '../../../widgets/default.dart';
import '../../../widgets/suffixIcon.dart';
import '../../../widgets/validator.dart';
import '../../feed/feedScreen.dart';

class FormFields extends StatefulWidget {
  const FormFields({Key? key}) : super(key: key);

  @override
  State<FormFields> createState() => _FormFieldsState();
}

class _FormFieldsState extends State<FormFields> {
  TextEditingController _userEmailController = TextEditingController();
  TextEditingController _userPasswordController = TextEditingController();
  bool isObscure = true;
  bool isChecked = true;

  bool isLoading = false;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _userEmailController.dispose();
    _userPasswordController.dispose();
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    submitForm() async {
      setState(() {
        isLoading = true;
      });
      String res = await FirebaseAuthMethods().userLogin(
        email: _userEmailController.text,
        password: _userPasswordController.text,
        context: context,
      );
      if (res == "success") {
        setState(() {
          isLoading = false;
        });
        showSnakeBar("Login Successfully", context);
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => FeedScreen(),
          ),
        );
      } else {
        setState(() {
          isLoading = false;
        });
      }
    }

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0.w),
            child: Row(
              children: [
                Text(
                  "Email",
                  style: TextStyle(
                    color: Color(0xff023020),
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                  ),
                ),
                Text(
                  "*",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          TextFormField(
            controller: _userEmailController,
            validator: emailValidator,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              hintText: "Email",
              contentPadding: EdgeInsets.fromLTRB(20.w, 0, 0, 0),
              enabledBorder: customOutlineBorder(),
              focusedBorder: customOutlineBorder(),
              border: customOutlineBorder(),
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0.w),
            child: Row(
              children: [
                Text(
                  "Password",
                  style: TextStyle(
                    color: Color(0xff023020),
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                  ),
                ),
                Text(
                  "*",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          TextFormField(
            controller: _userPasswordController,
            validator: requiredField,
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.next,
            obscureText: isObscure,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.w, 0, 0, 0),
              hintText: "Password",
              enabledBorder: customOutlineBorder(),
              suffixIcon: suffixicon(
                  press: () {
                    setState(() {
                      isObscure = !isObscure;
                    });
                  },
                  icon: Icons.remove_red_eye),
              focusedBorder: customOutlineBorder(),
              border: customOutlineBorder(),
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          Row(
            children: [
              Checkbox(
                value: isChecked,
                onChanged: (value) {
                  setState(() {
                    isChecked = !isChecked;
                  });
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.r),
                ),
                side: BorderSide(
                  color: Color(0xff023020),
                ),
              ),
              SizedBox(
                width: 4.w,
              ),
              Text(
                "Remember me",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 8.h,
          ),
          isLoading
              ? Center(
                  child: CupertinoActivityIndicator(
                      animating: true,
                      color: Colors.green,
                      radius: 24,
                      key: UniqueKey()),
                )
              : defaultButton(
                  text: "Sign in",
                  press: () {
                    if (!_formKey.currentState!.validate()) {

                    } else {

                      submitForm();
                    }
                  }),
        ],
      ),
    );
  }

  OutlineInputBorder customOutlineBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(40),
      borderSide: BorderSide(color: Colors.grey),
    );
  }
}
