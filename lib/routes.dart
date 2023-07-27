import 'package:fashion_app/signin/signin.dart';
import 'package:fashion_app/signup/signup.dart';
import 'package:fashion_app/smsOTP/forgotPassword.dart';
import 'package:fashion_app/splashScreen/splashscreen.dart';
import 'package:flutter/material.dart';

import 'feed/feedScreen.dart';
import 'forgot/forgotPassword.dart';
import 'home/home.dart';
import 'lottie/splash.dart';

final Map<String, WidgetBuilder> routes = {
  Lottie.routeName: (context) => Lottie(),
  SplashScreen.routeName: (context) => SplashScreen(),
  SignUp.routeName: (context) => SignUp(),
  Signin.routeName: (context) => Signin(),
  ForgotScreen.routeName: (context) => ForgotScreen(),
  SmsOTP.routeName: (context) => SmsOTP(),
  FeedScreen.routeName: (context) => FeedScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
};
