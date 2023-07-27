import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../completeProfile/completeProfile.dart';
import '../../db/authentication/firebase_auth_methods.dart';
import '../../widget/customSnakeBar.dart';
import '../../widget/customTextFormLable.dart';
import '../../widget/default.dart';
import '../../widget/inputDecoration.dart';
import '../../widget/validator.dart';

class FormFields extends StatefulWidget {
  const FormFields({Key? key}) : super(key: key);

  @override
  State<FormFields> createState() => _FormFieldsState();
}

class _FormFieldsState extends State<FormFields> {
  TextEditingController _userEmailController = TextEditingController();
  TextEditingController _userPasswordController = TextEditingController();
  TextEditingController _userConfirmPasswordController =
      TextEditingController();
  bool isObscure = true;
  bool isCObscure = true;
  bool isChecked = true;
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    super.dispose();
    _userEmailController.dispose();
    _userPasswordController.dispose();
    _userConfirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    submitForm() async {
      setState(() {
        isLoading = true;
      });
      String res = await FirebaseAuthMethods().createUser(
        email: _userEmailController.text,
        password: _userPasswordController.text,
        context: context,
      );
      if (res == 'success') {
        setState(() {
          isLoading = false;
        });
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => CompleteProfle(),
          ),
        );
        showSnakeBar("Verify email", context);
      } else {
        setState(() {
          isLoading = false;
        });
        showSnakeBar(res, context);
      }
    }

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          customTextFieldLable(
            lableText: "Email",
            isRequired: true,
          ),
          SizedBox(
            height: 8.h,
          ),
          TextFormField(
            controller: _userEmailController,
            validator: emailValidator,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            decoration: customInputDecoration(
              suffixIcon: null,
              hintText: "Email",
              press: () {},
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          customTextFieldLable(isRequired: true, lableText: "Password"),
          SizedBox(
            height: 8.h,
          ),
          TextFormField(
            controller: _userPasswordController,
            validator: passwordValidator,
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.next,
            obscureText: isObscure,
            decoration: customInputDecoration(
                suffixIcon: Icons.remove_red_eye,
                hintText: "Password",
                press: () {
                  setState(() {
                    isObscure = !isObscure;
                  });
                }),
          ),
          SizedBox(
            height: 8.h,
          ),
          customTextFieldLable(isRequired: true, lableText: "Confirm Password"),
          SizedBox(
            height: 8.h,
          ),
          TextFormField(
            controller: _userConfirmPasswordController,
            validator: passwordValidator,
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.next,
            obscureText: isCObscure,
            decoration: customInputDecoration(
                suffixIcon: Icons.remove_red_eye,
                hintText: "Confirm Password",
                press: () {
                  setState(() {
                    isCObscure = !isCObscure;
                  });
                }),
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
                  color: Colors.blue,
                ),
              ),
              SizedBox(
                width: 8.w,
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
                  child: CupertinoActivityIndicator(),
                )
              : AnimatedContainer(
                  duration: Duration(milliseconds: 600),
                  curve: Curves.bounceIn,
                  child: defaultButton(
                      text: "Sign up",
                      press: () {
                        if (!_formKey.currentState!.validate()) {
                          // If the form is not valid, display a snackbar. In the real world,

                        } else {
                          // If the form is valid, display a snackbar. In the real world,
                          // you'd often call a server or save the information in a database.
                          submitForm();
                        }
                      }),
                ),
        ],
      ),
    );
  }
}
