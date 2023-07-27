import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GallaryScreen extends StatefulWidget {
  GallaryScreen({Key? key}) : super(key: key);

  @override
  State<GallaryScreen> createState() => _GallaryScreenState();
}

class _GallaryScreenState extends State<GallaryScreen> {
  final TextEditingController searchEditingController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    searchEditingController.dispose();
  }

  bool isShowUser = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: FutureBuilder(
        future: FirebaseFirestore.instance.collection('posts').get(),
        builder: (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CupertinoActivityIndicator(
                  animating: true,
                  color: Colors.green,
                  radius: 24,
                  key: UniqueKey()),
            );
          }
          return GridView.builder(
            itemCount: snapshot.data!.docs.length,
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: GridTile(
                  child: CachedNetworkImage(
                    imageUrl: snapshot.data!.docs[index]['postURL'],
                  ),
                ),
              );
            },
          );
        },
      )),
    );
  }
}
