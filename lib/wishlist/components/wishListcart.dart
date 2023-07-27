import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../orderpurchased/order.dart';

class WishCart extends StatefulWidget {
  final snap;
  const WishCart({Key? key, required this.snap}) : super(key: key);

  @override
  State<WishCart> createState() => _WishCartState();
}

class _WishCartState extends State<WishCart> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: InkWell(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Order()));
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Card(
                  clipBehavior: Clip.antiAlias,
                  elevation: 2.0,
                  color: Colors.grey.withOpacity(0.1),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.0.h),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.black,
                        backgroundImage: NetworkImage(
                          widget.snap['postPic'],
                        ),
                      ),
                      title: Padding(
                        padding: const EdgeInsets.only(bottom: 6.0),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 160.w,
                              child: Text(
                                "${widget.snap['postTitle']}",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.h,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      trailing: Column(
                        children: [
                          Chip(
                            label: Text(
                              "Buy",
                              style: TextStyle(color: Colors.white),
                            ),
                            avatar: Icon(FontAwesomeIcons.circle),
                          ),
                          Text(
                            DateFormat.yMMMd().format(
                              widget.snap["datePublished"].toDate(),
                            ),
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      subtitle: Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "${widget.snap['postLocation']}",
                              style: TextStyle(
                                fontSize: 15.sp,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                          ),
                          SizedBox(height: 5.h),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Row(
                              children: [
                                Text(
                                  "${widget.snap['postPrice']}",
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    color: Color.fromARGB(255, 19, 18, 18),
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.justify,
                                ),
                                Text(
                                  " Price",
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
