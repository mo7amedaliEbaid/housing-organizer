import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

final requiredField = MultiValidator([
  RequiredValidator(errorText: 'Field is required'),
]);
final emailValidator = MultiValidator([
  RequiredValidator(errorText: 'email is required'),
  EmailValidator(errorText: 'enter a valid email address'),
]);

final passwordValidator = MultiValidator([
  RequiredValidator(errorText: 'password is required'),
  MinLengthValidator(8, errorText: 'password must be at least 8 digits long'),
  PatternValidator(r'(?=.*?[#?!@$%^&*-])',
      errorText: 'passwords must have at least one special character'),
]);
final numberValidator = MultiValidator([
  RequiredValidator(errorText: 'Number is required'),
  MinLengthValidator(
    10,
    errorText: 'Phone Number must be at least 10 digits long',
  ),
  PatternValidator(
    r'(^(?:[+0]9)?[0-9]{10,12}$)',
    errorText: 'Phone Number is not valid.',
  )
]);
final cnicValidator = MultiValidator([
  RequiredValidator(errorText: 'Cnic is required'),
  MinLengthValidator(
    10,
    errorText: 'CNIC Number must be 13 digits long',
  ),
  PatternValidator(
    r'(^(?:[+0]9)?[0-9]{10,12}$)',
    errorText: 'CNIC Number is not valid.',
  )
]);
