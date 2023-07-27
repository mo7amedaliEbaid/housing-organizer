
import 'package:fashion_app/ui/screens/feed/feedScreen.dart';
import 'package:fashion_app/ui/screens/forgot/forgotPassword.dart';
import 'package:fashion_app/ui/screens/home/home.dart';
import 'package:fashion_app/ui/screens/lottie/splash.dart';
import 'package:fashion_app/ui/screens/signin/signin.dart';
import 'package:fashion_app/ui/screens/signup/signup.dart';
import 'package:fashion_app/ui/screens/smsOTP/forgotPassword.dart';
import 'package:fashion_app/ui/screens/splashScreen/splashscreen.dart';
import 'package:flutter/material.dart';

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
