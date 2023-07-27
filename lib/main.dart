import 'package:fashion_app/provider/userProviders.dart';
import 'package:fashion_app/routes.dart';
import 'package:fashion_app/signin/signin.dart';
import 'package:fashion_app/widget/customSnakeBar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:provider/provider.dart';

import 'feed/feedScreen.dart';
import 'firebase_options.dart';
import 'lottie/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in,unit in dp)
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
            // You can use the library anywhere in the app even in theme
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
          // if the connection is made
          if (snapshot.connectionState == ConnectionState.active) {
            // snapshot has data then return the screen
            if (snapshot.hasData) {
              return FeedScreen();
            } else if (snapshot.hasError) {
              // has errorr
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
          return Signin();
        },
      ),
    );
  }
}
