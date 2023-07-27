import 'package:fashion_app/provider/userProviders.dart';
import 'package:fashion_app/core/routes.dart';
import 'package:fashion_app/ui/screens/feed/feedScreen.dart';
import 'package:fashion_app/ui/screens/lottie/splash.dart';
import 'package:fashion_app/ui/screens/signupscreen/signup.dart';
import 'package:fashion_app/ui/widgets/customSnakeBar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (_) => UserProviders(),
            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'First Method',
            initialRoute: Lottie.routeName,
            routes: routes,
            theme: ThemeData.light(),
            themeMode: ThemeMode.system,
            darkTheme: ThemeData.dark(),
            home: child,
          ),
        );
      },
      child: StreamBuilder(
        stream: FirebaseAuth.instance.idTokenChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              return FeedScreen();
            } else if (snapshot.hasError) {
              return showSnakeBar(snapshot.error.toString(), context);
            }
          }
          // if connection is on waiting state
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            );
          }
          return SignupScreen();
        },
      ),
    );
  }
}
