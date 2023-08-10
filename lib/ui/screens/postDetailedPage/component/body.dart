import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../services/firestore_methods.dart';

class Body extends StatefulWidget {
  final snap;
  Body({
    Key? key,
    required this.snap,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        Stack(
          children: [
            Container(
              height: 300.h,
              width: double.infinity,
              child: CachedNetworkImage(
                imageUrl: widget.snap!["postURL"],
              ),
            ),
            Positioned(
              bottom: -5.h,
              right: -20.w,
              child: InkWell(
                onTap: () {
                  FirestoreMethods().likePost(
                      postId: widget.snap!["postId"],
                      uid: widget.snap!["uid"],
                      like: widget.snap!["likes"]);
                },
                child: Container(
                  width: 115.w,
                  height: 115.h,
                  decoration: BoxDecoration(
                      color: Colors.black38, shape: BoxShape.circle),
                  child: Icon(
                    FontAwesomeIcons.thumbsUp,
                    size: 54.sp,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 16.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 0.0),
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          border: Border.all(color: Colors.green)),
                      child: Text(
                        widget.snap!["houseType"],
                        style: TextStyle(color: Colors.green),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      likes(),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 14.h,
              ),
              Text(
                widget.snap!["title"],
                style: TextStyle(
                  fontSize: 28.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 14.h,
              ),
              Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    color: Colors.green,
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Text(widget.snap!["location"]),
                ],
              ),
              SizedBox(
                height: 12.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  statsHouse(
                      iconData: Icons.bed,
                      items: widget.snap!["beds"],
                      title: "Beds"),
                  statsHouse(
                      iconData: Icons.bathroom,
                      items: widget.snap!["rooms"],
                      title: "Rooms"),
                  statsHouse(
                      iconData: Icons.expand,
                      items: widget.snap!["sqft"],
                      title: "sqft"),
                ],
              ),
              SizedBox(
                height: 8.h,
              ),
              Divider(),
              SizedBox(
                height: 8.h,
              ),
              ListTile(
                leading: CircleAvatar(),
                title: Text(widget.snap!["userName"]),
                subtitle: Text(widget.snap!["useremail"]),
                trailing: Icon(FontAwesomeIcons.phone),
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                "Overview",
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                widget.snap!["overview"],
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Status",
                    style: TextStyle(fontSize: 16.sp),
                  ),
                  Text(widget.snap!["houseStatus"]),
                ],
              ),
              SizedBox(
                height: 8.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Contact Number", style: TextStyle(fontSize: 16.sp)),
                  Text(widget.snap!["contactnumber"]),
                ],
              ),
              SizedBox(
                height: 8.h,
              ),
            ],
          ),
        ),
      ]),
    );
  }

  Widget likes() {
    setState(() {});
    return Text("${widget.snap!["likes"].length} Likes");
  }

  Widget statsHouse({
    required IconData iconData,
    required String items,
    required String title,
  }) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(8.r),
          width: 44.w,
          height: 44.h,
          decoration: BoxDecoration(
            color: Colors.green.withOpacity(0.04),
            shape: BoxShape.circle,
          ),
          child: Row(
            children: [
              Icon(
                iconData,
                color: Colors.green,
              ),
            ],
          ),
        ),
        SizedBox(
          width: 8.w,
        ),
        Text("$items $title"),
      ],
    );
  }
}
