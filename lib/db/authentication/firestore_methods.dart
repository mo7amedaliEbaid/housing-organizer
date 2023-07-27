import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashion_app/db/authentication/storage_methods.dart';
import 'package:uuid/uuid.dart';

import '../../models/posts.dart';

class FirestoreMethods {
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  // for uploading the image
  Future<String> uploadPost({
    required Uint8List file,
    required String houseStatus,
    required String houseType,
    required final uid,
    required final contactNumber,
    required final email,
    required String username,
    required String title,
    required String location,
    required String overview,
    required String price,
    required String beds,
    required String rooms,
    required String sqft,
  }) async {
    String res = "Some error occured";
    try {
      String imageURL = await StorageMethods().uploadImageToStorage(
        "posts",
        file,
        true,
      );

      String postId = const Uuid().v1();
      UserPost userPost = UserPost(
        houseStatus: houseStatus,
        houseType: houseType,
        title: title,
        uid: uid,
        userName: username,
        contactnumber: contactNumber,
        email: email,
        postId: postId,
        datePublished: DateTime.now(),
        postURL: imageURL,
        likes: [],
        beds: beds,
        location: location,
        overview: overview,
        price: price,
        rooms: rooms,
        sqft: sqft,
      );
      _firebaseFirestore.collection("posts").doc(postId).set(userPost.toJson());
      res = "success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  // for liking the post
  Future<void> likePost({
    required String postId,
    required String uid,
    required List like,
  }) async {
    try {
      if (like.contains(uid)) {
        await _firebaseFirestore.collection("posts").doc(postId).update(
          {
            "likes": FieldValue.arrayRemove([uid]),
          },
        );
      } else {
        await _firebaseFirestore.collection("posts").doc(postId).update(
          {
            "likes": FieldValue.arrayUnion([uid]),
          },
        );
      }
    } catch (e) {
      print(e);
    }
  }

  // deleting the post
  Future<String> deletePost({required String postId}) async {
    String res = "Some error occured";
    try {
      await _firebaseFirestore.collection('posts').doc(postId).delete();
      res = "success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  // editin
  Future<String> updateUserData(
      {required String name,
      required String country,
      required String age,
      required String phoneNo,
      required String address,
      //required String cnic,
      required String email,
      required String gender,
      required String lastName,
      required String profilePic,
      required String uid}) async {
    String res = "Some error occured";
    // this is the function that has to edit the username
    try {
      await _firebaseFirestore.collection('users').doc(uid).set({
        'fullName': name,
        "country": country,
        "age": age,
        "phoneNo": phoneNo,
        "address": address,
        "lastName": lastName,
        "email": email,
       // "cnic": cnic,
        "profilePic": profilePic,
        "uid": uid,
      });
      res = "success";
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}
