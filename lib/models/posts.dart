// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserPost {
  final title;
  final houseStatus;
  final houseType;
  final email;
  final contactnumber;
  final location;
  final overview;
  final price;
  final beds;
  final rooms;
  final sqft;
  final uid;
  final userName;
  final postId;
  final datePublished;
  final postURL;

  final likes;
  // creating the constructor here...
  UserPost({
    required this.houseStatus,
    required this.houseType,
    required this.title,
    required this.contactnumber,
    required this.email,
    required this.uid,
    required this.userName,
    required this.postId,
    required this.datePublished,
    required this.postURL,
    required this.likes,
    required this.beds,
    required this.location,
    required this.overview,
    required this.price,
    required this.rooms,
    required this.sqft,
  });
  // converting it to the map object
  Map<String, dynamic> toJson() => {
        "houseStatus": houseStatus,
        "houseType": houseType,
        "postId": postId,
        "contactnumber": contactnumber,
        "useremail": email,
        "title": title,
        "userName": userName,
        "location": location,
        "price": price,
        "beds": beds,
        "rooms": rooms,
        "sqft": sqft,
        "overview": overview,
        "datePublished": datePublished,
        "likes": likes,
        "postURL": postURL,
        "uid": FirebaseAuth.instance.currentUser!.uid,
      };
  static UserPost fromSnap(DocumentSnapshot documentSnapshot) {
    var snapshot = documentSnapshot.data() as Map<String, dynamic>;
    return UserPost(
      uid: snapshot['uid'],
      houseStatus: snapshot['houseStatus'],
      houseType: snapshot['houseType'],
      email: snapshot['email'],
      contactnumber: snapshot['contactnumber'],
      userName: snapshot['userName'],
      likes: snapshot['likes'],
      datePublished: snapshot['datePublished'],
      postURL: snapshot['postURL'],
      postId: snapshot['postId'],
      sqft: snapshot['sqft'],
      beds: snapshot['beds'],
      location: snapshot['location'],
      overview: snapshot['overview'],
      price: snapshot['price'],
      rooms: snapshot['rooms'],
      title: snapshot['title'],
    );
  }
}
