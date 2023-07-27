import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:provider/provider.dart';

import '../provider/userProviders.dart';
import 'components/card.dart';

class MyAdminPage extends StatelessWidget {
  const MyAdminPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var userCreaditials = Provider.of<UserProviders>(context).getUser;
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("posts")
            .orderBy(
              "datePublished",
              descending: true,
            )
            .snapshots(),
        builder: (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CupertinoActivityIndicator(
                radius: 35,
                animating: true,
                color: Colors.green,
              ),
            );
          }

          return snapshot.data!.docs.length == 0
              ? Center(child: Text("No data is to display."))
              : ListView.custom(
                  childrenDelegate: SliverChildBuilderDelegate(
                    (BuildContext, index) {
                      return adminCard(
                        context,
                        snapshot.data!.docs[index].data(),
                      );
                    },
                    childCount: snapshot.data!.docs.length,
                  ),
                  shrinkWrap: true,
                  padding: EdgeInsets.all(5),
                  scrollDirection: Axis.vertical,
                );
        },
      ),
    );
  }
}
