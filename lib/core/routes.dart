
import '../ui/screens/feed/feedScreen.dart';
import '../ui/screens/forgot/forgotPassword.dart';
import '../ui/screens/home/home.dart';
import '../ui/screens/lottie/splash.dart';
import '../ui/screens/smsOTP/forgotPassword.dart';
import '../ui/screens/splashScreen/splashscreen.dart';
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
