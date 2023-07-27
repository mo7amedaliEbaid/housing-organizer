
import 'package:fashion_app/ui/screens/feed/feedScreen.dart';
import 'package:fashion_app/ui/screens/forgot/forgotPassword.dart';
import 'package:fashion_app/ui/screens/home/home.dart';
import 'package:fashion_app/ui/screens/lottie/splash.dart';
import 'package:fashion_app/ui/screens/smsOTP/forgotPassword.dart';
import 'package:fashion_app/ui/screens/splashScreen/splashscreen.dart';
import 'package:flutter/material.dart';

import '../ui/screens/signinscreen/signin.dart';
import '../ui/screens/signupscreen/signup.dart';

final Map<String, WidgetBuilder> routes = {
  Lottie.routeName: (context) => Lottie(),
  SplashScreen.routeName: (context) => SplashScreen(),
  Signin.routeName: (context) => Signin(),
  SignupScreen.routeName: (context) => SignupScreen(),
  ForgotScreen.routeName: (context) => ForgotScreen(),
  SmsOTP.routeName: (context) => SmsOTP(),
  FeedScreen.routeName: (context) => FeedScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
};
