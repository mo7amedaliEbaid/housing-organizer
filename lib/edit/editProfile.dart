import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../edit/components/body.dart';
import '../feed/feedScreen.dart';
import '../home/home.dart';
import '../provider/userProviders.dart';

class EditProfile extends StatelessWidget {
  static String routeName = "/resetPassword";

  @override
  Widget build(BuildContext context) {
    var creaditials = Provider.of<UserProviders>(context).getUser;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => FeedScreen()));
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Edit Profile',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 20.sp,
          ),
        ),
      ),
      body: Body(),
    );
  }
}
