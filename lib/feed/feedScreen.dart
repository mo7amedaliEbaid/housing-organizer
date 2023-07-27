import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widget/floatingActionButton.dart';
import 'global_variables.dart';

class FeedScreen extends StatefulWidget {
  static String routeName = "/feedScreen";

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    pageController = PageController();
  }

  // creating the page controlller
  late PageController pageController;

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  int _page = 0;
  selectedTab(int selectedPage) {
    pageController.jumpToPage(selectedPage);
  }

  onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: items,
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: onPageChanged,
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.r),
            topRight: Radius.circular(30.r),
          ),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, -15),
                blurRadius: 20.0,
                color: Color(0xFFDADADA).withOpacity(0.45))
          ],
        ),
        child: SafeArea(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  selectedTab(0);
                });
              },
              icon: Icon(
                FontAwesomeIcons.home,
                color: _page == 0
                    ? Colors.green.withOpacity(0.5)
                    : Color(0xFFB6B6B6B6),
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  selectedTab(1);
                });
              },
              icon: Icon(
                FontAwesomeIcons.search,
                color: _page == 1
                    ? Colors.green.withOpacity(0.5)
                    : Color(0xFFB6B6B6B6),
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  selectedTab(2);
                });
              },
              icon: Icon(
                FontAwesomeIcons.add,
                color: _page == 1
                    ? Colors.green.withOpacity(0.5)
                    : Color(
                        0xFFB6B6B6B6,
                      ),
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  selectedTab(3);
                });
              },
              icon: Icon(
                FontAwesomeIcons.heart,
                color: _page == 3
                    ? Colors.green.withOpacity(0.5)
                    : Color(0xFFB6B6B6B6),
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  selectedTab(4);
                });
              },
              icon: SvgPicture.asset("assets/icons/User Icon.svg",
                  color: _page == 4
                      ? Colors.red.withOpacity(0.5)
                      : Color(0xFFB6B6B6B6)),
            ),
          ],
        )),
      ),
    );
  }
}
