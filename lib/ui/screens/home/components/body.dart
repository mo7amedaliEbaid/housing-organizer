import 'package:fashion_app/ui/screens/home/components/productHeading.dart';
import 'package:fashion_app/ui/screens/yourlocation/yourlocation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';

import 'package:provider/provider.dart';

import '../../../../provider/userProviders.dart';
import '../../../widgets/customCard.dart';
import '../../house/house.dart';
import '../../popularPage/popularHouse.dart';

import 'header.dart';
import 'menuHouses.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  addData() async {
    UserProviders userProviders = Provider.of(context, listen: false);

    await userProviders.refreshUser();
  }

  List text = [
    "Find Real Estate Websites Canada\nat Shopwebly, the Website to Compare Prices!\nFind and Compare Real Estate\nWebsites Canada Online. Save Now\nat Shopwebly! Easy Acces ",
    "Search Quality Answers Now. Get The Best\nResult With ZapMeta About Quality\nAnswers Now. Find More Vancouver Real Estate Agent.\nZapMeta Offers The Overview from 6 E",
    "Need some inspiration for your next\nreal estate advertising campaign? Check\nout these 42 great examples of real estate ads\non Facebook.",
    "Real estate ads are used to promote\nrealtors and real estate companies.\nThey can come in many forms (e.g., text, image,\nand video",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(left: 16.0.w, right: 16.0.w, top: 16.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 16.h,
              ),
              IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => GeolocatorWidget()));
                  },
                  icon: Icon(CupertinoIcons.location_solid)),
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  SizedBox(width: 1.w),
                  menuButton(
                    iconData: Icons.house,
                    text: "House",
                    press: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => HouseScreen(
                            pageInfo: "House",
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    width: 7.w,
                  ),
                  menuButton(
                    iconData: Icons.villa,
                    text: "Villa",
                    press: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => HouseScreen(
                                pageInfo: "Villa",
                              )));
                    },
                  ),
                  SizedBox(
                    width: 7.w,
                  ),
                  menuButton(
                    iconData: Icons.apartment,
                    text: "Apartment",
                    press: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => HouseScreen(
                            pageInfo: "Apartment",
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              productHeading(
                press: () {},
                text: "See all",
                title: "Popular",
              ),
              SizedBox(
                height: 16.h,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    customCard(
                      press: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => PopularPageScreen(
                                  image: "assets/images/home3.jpg",
                                  location: "Cairo G6/2",
                                  price: "12323 price",
                                  title: "Owent Apartment",
                                )));
                      },
                      image: "assets/images/home3.jpg",
                      title: "Owent Apartment",
                      type: "Apartment",
                    ),
                    customCard(
                      press: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => PopularPageScreen(
                                  image: "assets/images/home2.jpg",
                                  location: "Cairo G6/2",
                                  price: "12323 price",
                                  title: "Shophouse",
                                )));
                      },
                      image: "assets/images/home2.jpg",
                      title: "Shophouse",
                      type: "Apartment",
                    ),
                    customCard(
                      press: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => PopularPageScreen(
                                  image: "assets/images/eral.jpg",
                                  location: "Cairo G6/2",
                                  price: "12323 price",
                                  title: "Penthouses",
                                )));
                      },
                      image: "assets/images/eral.jpg",
                      title: "Penthouses",
                      type: "Apartment",
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              productHeading(
                press: () {},
                text: "See all",
                title: "Nearby Your Location",
              ),
              SizedBox(
                height: 16.h,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    customCard(
                      press: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => PopularPageScreen(
                                  image: "assets/images/home6.jpg",
                                  location: "Cairo G6/2",
                                  price: "12323 price",
                                  title: "Multifamily Homes",
                                )));
                      },
                      image: "assets/images/home6.jpg",
                      title: "Multifamily Homes",
                      type: "House",
                    ),
                    customCard(
                      press: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => PopularPageScreen(
                                  image: "assets/images/home4.png",
                                  location: "Cairo G6/2",
                                  price: "12323 price",
                                  title: "Townhomes",
                                )));
                      },
                      image: "assets/images/home4.png",
                      title: "Townhomes",
                      type: "House",
                    ),
                    customCard(
                      press: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => PopularPageScreen(
                                  image: "assets/images/home5.jpg",
                                  location: "Cairo G6/2",
                                  price: "12323 price",
                                  title: "Tiny Home",
                                )));
                      },
                      image: "assets/images/home5.jpg",
                      title: "Tiny Home",
                      type: "House",
                    ),
                    customCard(
                      press: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => PopularPageScreen(
                                  image: "assets/images/home6.jpg",
                                  location: "Cairo G6/2",
                                  price: "12323 price",
                                  title: "Single-Family Homes",
                                )));
                      },
                      image: "assets/images/home6.jpg",
                      title: "Single-Family Homes",
                      type: "House",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
