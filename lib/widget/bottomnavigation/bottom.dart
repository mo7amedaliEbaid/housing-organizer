import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../db/authentication/firebase_auth_methods.dart';
import '../../provider/userProviders.dart';
import '../customSnakeBar.dart';

Widget bottom(BuildContext context, var snap) {
  var creaditials = Provider.of<UserProviders>(context).getUser;

  return InkWell(
    onTap: () async {
      String res = await FirebaseAuthMethods().addToCart(
        uid: snap!['uid'],
        postId: snap!['postId'],
        postPic: snap!['postURL'],
        postPrice: snap!['price'],
        postTitle: snap!['title'],
        postLocation: snap!['location'],
      );

      if (res == 'success') {
        // ignore: use_build_context_synchronously
        showSnakeBar("The Item is added to the wishlist.", context);
      } else {
        // ignore: use_build_context_synchronously
        showSnakeBar(res, context);
      }
    },
    child: Container(
      height: 60.h,
      width: 180.w,
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(
          "Add to Wishlist",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.sp,
          ),
        ),
      ),
    ),
  );
}
