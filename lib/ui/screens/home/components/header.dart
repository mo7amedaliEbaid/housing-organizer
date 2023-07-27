import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../provider/userProviders.dart';
import '../../adminPage/adminPage.dart';

Row header(BuildContext context, String locaiton) {
  var creaditials = Provider.of<UserProviders>(context).getUser;
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Location",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              Icon(
                Icons.keyboard_arrow_down_outlined,
                color: Colors.grey,
              ),
            ],
          ),
          SizedBox(
            height: 8.h,
          ),
          Row(
            children: [
              Icon(
                Icons.location_on,
                color: Colors.green,
              ),
              SizedBox(
                width: 16.w,
              ),
              Text(
                locaiton,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
      UserProviders().isLoading
          ? CircularProgressIndicator()
          : Container(
              width: 44.w,
              height: 44.h,
              decoration: BoxDecoration(
                  color: Colors.green.withOpacity(
                    0.04,
                  ),
                  borderRadius: BorderRadius.circular(10.r)),
              child: creaditials.email == "abubakarhussain.official@gmail.com"
                  ? IconButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => MyAdminPage()));
                      },
                      icon: Icon(
                        Icons.admin_panel_settings_outlined,
                        color: Colors.green,
                      ))
                  : Icon(
                      Icons.location_on,
                      color: Colors.green,
                    ),
            ),
    ],
  );
}
