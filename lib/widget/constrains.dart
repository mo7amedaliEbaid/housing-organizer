// Form Error
import 'package:flutter/material.dart';

final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";

InputDecoration otpInputDecoration() {
  return InputDecoration(
    contentPadding: EdgeInsets.symmetric(vertical: 30, horizontal: 14),
    enabledBorder: outlineborder(),
    floatingLabelBehavior: FloatingLabelBehavior.always,
    focusedBorder: outlineborder(),
    border: outlineborder(),
  );
}

OutlineInputBorder outlineborder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: BorderSide(color: Colors.grey),
    gapPadding: 10,
  );
}
