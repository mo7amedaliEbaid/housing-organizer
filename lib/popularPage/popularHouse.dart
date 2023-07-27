import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../feed/feedScreen.dart';
import '../widget/bottomnavigation/bottomappbar.dart';

class PopularPageScreen extends StatelessWidget {
  final image;
  final location;
  final title;
  final price;
  const PopularPageScreen({
    Key? key,
    required this.image,
    required this.location,
    required this.price,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.asset(image),
                  Positioned(
                    top: 10,
                    left: 10.w,
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => FeedScreen()));
                          },
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              ListTile(
                leading: CircleAvatar(backgroundColor: Colors.black),
                title: Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                trailing: Text(
                  "Buy",
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(location),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "House: Created by David Shore. With Hugh Laurie, Omar Epps, Robert Sean Leonard, Jesse Spencer. An antisocial maverick doctor A specialized real estate investment firm bridging the gap between sellers and real estate investors positioned to find the best deals on the market while going one step further and position the property for rental or resell. Throughout my time with liberal trust my fundamental duties were to interact with prospects to identify interest, negotiate contracts and purchase terms while providing ideal solutions to clients.A specialized real estate investment firm bridging the gap between sellers and real estate investors positioned to find the best deals on the market while going one step further and position the property for rental or resell. Throughout my time with liberal trust my fundamental duties were to interact with prospects to identify interest, negotiate contracts and purchase terms while providing ideal solutions to clients.…see more Skills: Contact who specializes in diagnostic ...",
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 80.0,
        color: Colors.white,
        padding: EdgeInsets.only(top: 20.0),
        child: Theme(
          data: Theme.of(context).copyWith(
              // sets the background color of the `BottomNavigationBar`
              canvasColor: Colors.white,
              // sets the active color of the `BottomNavigationBar` if `Brightness` is light
              primaryColor: Colors.red,
              bottomAppBarColor: Colors.green,
              textTheme: Theme.of(context).textTheme.copyWith(
                  caption: TextStyle(
                      color: Colors
                          .grey))), // sets the inactive color of the `BottomNavigationBar`
          child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: 0,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.circle),
                    label: "4343243 Price",
                    backgroundColor: Colors.black),
                BottomNavigationBarItem(
                    icon: Icon(Icons.circle),
                    label: "Buy",
                    backgroundColor: Colors.black),
              ]),
        ),
      ),
    );
  }
}
